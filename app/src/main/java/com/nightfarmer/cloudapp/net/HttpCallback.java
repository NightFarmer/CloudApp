package com.nightfarmer.cloudapp.net;

import java.io.File;

/**
 * Created by zhangfan on 16-8-10.
 */
public interface HttpCallback {

    void onSuccess(String result);

    void onFinish();

    void onFailure(String msg, int errorCode);

    void onProcess(long process, long length);
}
