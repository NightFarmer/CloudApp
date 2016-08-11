package com.nightfarmer.cloudapp.net;

import android.os.Handler;

import java.io.IOException;
import java.util.HashMap;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.Response;

/**
 * Created by zhangfan on 16-8-11.
 */
public class RequestHandler implements Callback {
    private Handler handler = new Handler();

    HttpCallback httpCallback;
    private static final HashMap<Integer, String> errorMap = new HashMap<>();

    static {
        errorMap.put(1, "请求失败，请重试");
        errorMap.put(2, "请求失败");
        errorMap.put(3, "数据异常");
        errorMap.put(4, "数据格式异常");
        errorMap.put(5, "服务器异常");
    }

    public RequestHandler(HttpCallback httpCallback) {
        this.httpCallback = httpCallback;
    }

    @Override
    public void onFailure(Call call, IOException e) {
        handler.post(new Runnable() {
            @Override
            public void run() {
                callFailure(1,"");
            }
        });
    }

    @Override
    public void onResponse(Call call, final Response response) throws IOException {
        if (!response.isSuccessful()){
            handler.post(new Runnable() {
                @Override
                public void run() {
                    callFailure(2,"");
                }
            });
        }
        final String string = response.body().string();
        handler.post(new Runnable() {
            @Override
            public void run() {
                httpCallback.onSuccess(string);
                httpCallback.onFinish();
            }
        });
    }

    private void callFailure(int errorCode, String msg) {
        httpCallback.onFailure(errorMap.get(errorCode), errorCode);
        httpCallback.onFinish();
    }

}
