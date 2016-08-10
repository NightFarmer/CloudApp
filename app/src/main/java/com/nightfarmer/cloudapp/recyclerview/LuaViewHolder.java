package com.nightfarmer.cloudapp.recyclerview;

import android.support.v7.widget.RecyclerView;
import android.view.View;

import java.util.HashMap;

/**
 * Created by zhangfan on 16-8-10.
 */
public class LuaViewHolder extends RecyclerView.ViewHolder {

    private HashMap<String, Object> objectMap = new HashMap<>();

    public void putView(String name, Object view){
        objectMap.put(name, view);
    }

    public Object getView(String name){
        return objectMap.get(name);
    }

    public void putObject(String name, Object view){
        objectMap.put(name, view);
    }

    public Object getObject(String name){
        return objectMap.get(name);
    }

    public LuaViewHolder(View itemView) {
        super(itemView);
    }
}
