package com.nightfarmer.cloudapp.net;

import java.io.File;

import okhttp3.Call;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;

/**
 * Created by zhangfan on 16-8-11.
 */
public class HttpCall {

    private static final OkHttpClient okClient = new OkHttpClient();

    public static void downLoad(String url, File file, HttpCallback callback) {
        Request request = new Request.Builder().url(url).build();
        FileDownLoadHandler downLoadHandler = new FileDownLoadHandler(file);
        downLoadHandler.setHttpCallback(callback);
        okClient.newCall(request).enqueue(downLoadHandler);
    }

    public static void request(String url, HttpCallback callback) {
        FormBody.Builder builder = new FormBody.Builder();

        FormBody formBody = builder.build();
        Request request = new Request.Builder()
                .url(url)
                .post(formBody)
                .build();
        Call call = okClient.newCall(request);

        call.enqueue(new RequestHandler(callback));
    }
}
