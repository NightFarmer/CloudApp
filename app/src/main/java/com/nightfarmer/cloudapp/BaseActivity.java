package com.nightfarmer.cloudapp;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.text.TextUtils;
import android.widget.Toast;

import org.keplerproject.luajava.LuaBridge;
import org.keplerproject.luajava.LuaState;
import org.keplerproject.luajava.LuaStateFactory;

import java.io.File;

/**
 * Created by zhangfan on 16-8-10.
 */
public class BaseActivity extends AppCompatActivity {

    protected LuaState luaState;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        String activity = getIntent().getStringExtra("Activity");
        String fileName = "" + activity + ".lua";
        String loadFile = LuaBridge.loadFile(this, new File(getFilesDir(), fileName));
        if (TextUtils.isEmpty(loadFile)) {
            loadFile = LuaBridge.loadAssets(this, fileName);
            if (TextUtils.isEmpty(loadFile)) {
                Toast.makeText(BaseActivity.this, "功能未实现", Toast.LENGTH_SHORT).show();
                finish();
                return;
            }
        }
        luaState = LuaStateFactory.newLuaState();
        luaState.openLibs();

        luaState.pushJavaObject(this);
        luaState.setGlobal("context");
        luaState.LdoString(loadFile);
    }

    public void loadFile(String file) {
        String fileName = "" + file + ".lua";
        String loadFile = LuaBridge.loadFile(this, new File(getFilesDir(), fileName));
        if (TextUtils.isEmpty(loadFile)) {
            loadFile = LuaBridge.loadAssets(this, fileName);
            if (TextUtils.isEmpty(loadFile)) {
                return;
            }
        }
        luaState.LdoString(loadFile);
    }
//
//    public String getClassName(){
//        return this.getClass().getName();
//    }

    public Intent createActivityIntent(String activityName) {
        Intent intent = new Intent(this, CommonActivity.class);
        intent.putExtra("Activity", activityName);
        return intent;
    }

}
