package com.nightfarmer.cloudapp;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.GridLayoutManager;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);

//        setContentView();

        Intent intent = new Intent(this, CommonActivity.class);
        intent.putExtra("Activity", "HomeActivity");
        startActivity(intent);
new GridLayoutManager(this, 3);
        finish();
    }
}
