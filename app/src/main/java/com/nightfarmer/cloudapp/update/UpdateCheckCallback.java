package com.nightfarmer.cloudapp.update;

/**
 * Created by zhangfan on 16-8-11.
 */
public interface UpdateCheckCallback {
    void onSuccess(VersionInfo versionInfo );
    void onFailure();
}
