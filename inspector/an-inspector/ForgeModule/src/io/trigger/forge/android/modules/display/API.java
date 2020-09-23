package io.trigger.forge.android.modules.display;

import android.content.pm.ActivityInfo;
import android.os.Build;
import android.view.WindowManager;

import io.trigger.forge.android.core.ForgeApp;
import io.trigger.forge.android.core.ForgeParam;
import io.trigger.forge.android.core.ForgeTask;

public class API {
    public static void orientation_forcePortrait(final ForgeTask task) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.GINGERBREAD) {
            ForgeApp.getActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_PORTRAIT);
        } else {
            ForgeApp.getActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        }
        if (task != null) {
            task.success();
        }
    }

    public static void orientation_forceLandscape(final ForgeTask task) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.GINGERBREAD) {
            ForgeApp.getActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
        } else {
            ForgeApp.getActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        }
        if (task != null) {
            task.success();
        }
    }

    public static void orientation_allowAny(final ForgeTask task) {
        ForgeApp.getActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED);
        if (task != null) {
            task.success();
        }
    }


    public static void setWakeLock(final ForgeTask task, @ForgeParam("enabled") final boolean enabled) {
        task.performUI(new Runnable() {
            @Override
            public void run() {
                if (enabled) {
                    ForgeApp.getActivity().getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
                } else {
                    ForgeApp.getActivity().getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
                }
                task.success();
            }
        });
    }
}
