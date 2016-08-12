package com.nightfarmer.cloudapp;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;

import com.nightfarmer.cloudapp.update.FileInfo;
import com.nightfarmer.cloudapp.update.FileUpdateUtil;
import com.nightfarmer.cloudapp.update.VersionInfo;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);

//        setContentView();

//        VersionInfo versionInfo = new VersionInfo();
//        versionInfo.versionCode="1";
//        versionInfo.fileList = new ArrayList<>();
//        FileInfo object = new FileInfo();
//        object.version="1";
//        object.name="a";
//        versionInfo.fileList.add(object);
//        List<FileInfo> fileToUpdate = FileUpdateUtil.getFileToUpdate(this, versionInfo);

//        FileUpdateUtil.UpdateVersionInfo(this,versionInfo);

        Intent intent = new Intent(this, CommonActivity.class);
        intent.putExtra("Activity", "HomeActivity");
//        intent.putExtra("Activity", "SettingActivity");
        startActivity(intent);
        finish();
//        new LinearLayout.LayoutParams(0,0).weight=1
//        new ScrollView(this).fullScroll(ScrollView.FOCUS_DOWN)
//        new EditText(this).setFilters();
//        new EditText(this).setInputType();
    }
}
