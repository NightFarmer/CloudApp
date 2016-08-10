package com.nightfarmer.cloudapp;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import org.keplerproject.luajava.LuaState;

public class CommonActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (luaState == null) return;
        luaState.getField(LuaState.LUA_GLOBALSINDEX, "onCreate");
        luaState.pushJavaObject(this);
        luaState.pushJavaObject(savedInstanceState);
        luaState.call(2, 0);
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (luaState == null) return;
        luaState.getField(LuaState.LUA_GLOBALSINDEX, "onResume");
        luaState.pushJavaObject(this);
        luaState.call(1, 0);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (luaState == null) return;
        luaState.getField(LuaState.LUA_GLOBALSINDEX, "onActivityResult");
        luaState.pushJavaObject(this);
        luaState.pushNumber(requestCode);
        luaState.pushNumber(resultCode);
        luaState.pushJavaObject(data);
        luaState.call(4, 0);
    }
}
