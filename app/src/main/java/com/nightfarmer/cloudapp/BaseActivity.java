package com.nightfarmer.cloudapp;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.text.TextUtils;
import android.widget.Toast;

import org.keplerproject.luajava.LuaBridge;
import org.keplerproject.luajava.LuaState;
import org.keplerproject.luajava.LuaStateFactory;

/**
 * Created by zhangfan on 16-8-10.
 */
public class BaseActivity extends AppCompatActivity {

    protected LuaState luaState;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        String activity = getIntent().getStringExtra("Activity");
        String luaCode = LuaBridge.loadAssets(this, "" + activity + ".lua");
        if (TextUtils.isEmpty(luaCode)) {
            Toast.makeText(BaseActivity.this, "功能未实现", Toast.LENGTH_SHORT).show();
            finish();
            return;
        }
        luaState = LuaStateFactory.newLuaState();
        luaState.openLibs();
        luaState.LdoString(luaCode);
    }


}
