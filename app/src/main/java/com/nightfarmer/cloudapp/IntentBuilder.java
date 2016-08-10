package com.nightfarmer.cloudapp;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

/**
 * Created by zhangfan on 16-8-10.
 */
public class IntentBuilder {

    public static Intent newActivityIntent(Context context, String activityName) {
        Intent intent = new Intent();
        ComponentName component = new ComponentName(context.getPackageName(), CommonActivity.class.getName());
        intent.setComponent(component);
        intent.putExtra("Activity", activityName);
        return intent;
    }
}
