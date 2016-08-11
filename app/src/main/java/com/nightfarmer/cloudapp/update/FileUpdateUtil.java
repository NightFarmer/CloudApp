package com.nightfarmer.cloudapp.update;

import android.content.Context;
import android.text.TextUtils;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.nightfarmer.cloudapp.net.HttpCall;
import com.nightfarmer.cloudapp.net.HttpCallback;

import org.keplerproject.luajava.LuaBridge;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhangfan on 16-8-11.
 */
public class FileUpdateUtil {

    public static List<FileInfo> getFileToUpdate(Context context, VersionInfo versionInfo) {
        ArrayList<FileInfo> fileUpdateList = new ArrayList<>();
        List<FileInfo> fileList = versionInfo.fileList;
        if (fileList == null || fileList.size() == 0) {
            return fileUpdateList;
        }
        if (!versionInfo.updateAll){
            return fileList;
        }
        String fileName = "version.json";
        File file = new File(context.getFilesDir(), fileName);
        String loadFile = LuaBridge.loadFile(context, file);
        if (TextUtils.isEmpty(loadFile)) {
            loadFile = LuaBridge.loadAssets(context, fileName);
            if (TextUtils.isEmpty(loadFile)) {
                return fileList;
            }
        }
        VersionInfo localInfo = new Gson().fromJson(loadFile, VersionInfo.class);
        List<FileInfo> localFileList = localInfo.fileList;
        if (localFileList == null || localFileList.size() == 0) {
            return fileList;
        }
        for (int i = 0; i < fileList.size(); i++) {
            if (!localFileList.contains(fileList.get(i))) {
                fileUpdateList.add(fileList.get(i));
            }
        }

        return fileUpdateList;
    }

    public static void updateVersionInfo(Context context, VersionInfo versionInfo) {
        File file = new File(context.getFilesDir(), "version.json");
        FileWriter fw = null;
        try {
            fw = new FileWriter(file);
            fw.write(new Gson().toJson(versionInfo));
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (fw != null) {
                    fw.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static void checkUpdate(final UpdateCheckCallback checkCallback) {
        HttpCall.request("https://github.com/NightFarmer/CloudApp/raw/master/app/src/main/assets/version.json", new HttpCallback() {
            @Override
            public void onSuccess(String result) {
                try {
                    VersionInfo versionInfo = new Gson().fromJson(result, VersionInfo.class);
                    checkCallback.onSuccess(versionInfo);
                    return;
                } catch (JsonSyntaxException e) {
                    e.printStackTrace();
                }
                checkCallback.onFailure();
            }

            @Override
            public void onFinish() {

            }

            @Override
            public void onFailure(String msg, int errorCode) {
                checkCallback.onFailure();
            }

            @Override
            public void onProcess(long process, long length) {

            }
        });
    }
}
