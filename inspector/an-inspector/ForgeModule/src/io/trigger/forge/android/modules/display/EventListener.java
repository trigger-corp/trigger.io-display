package io.trigger.forge.android.modules.display;

import com.google.gson.JsonObject;

import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import io.trigger.forge.android.core.ForgeApp;
import io.trigger.forge.android.core.ForgeEventListener;
import io.trigger.forge.android.core.ForgeLog;
import io.trigger.forge.android.core.ForgeViewController;

public class EventListener extends ForgeEventListener {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        ForgeLog.d("display.ForgeEventListener.onCreate");

        JsonObject config = ForgeApp.configForPlugin("display");

        // statusbar.hidden
        if (config.has("statusbar") && config.getAsJsonObject("statusbar").has("hidden")) {
            boolean hidden = config.getAsJsonObject("statusbar").get("hidden").getAsBoolean();
            ForgeViewController.setStatusBarHidden(hidden, null);

        // fullscreen.android  DEPRECATED: renamed to statusbar.hidden
        } else if (config.has("fullscreen") && config.getAsJsonObject("fullscreen").has("android")) {
            boolean hidden = config.getAsJsonObject("fullscreen").get("android").getAsBoolean();
            ForgeViewController.setStatusBarHidden(hidden, null);
        }

        // statusbar.transparent
        if (config.has("statusbar") && config.getAsJsonObject("statusbar").has("transparent")) {
            boolean transparent = config.getAsJsonObject("statusbar").get("transparent").getAsBoolean();
            ForgeViewController.setStatusBarTransparent(transparent, null);
        }

        if (config.has("statusbar") && config.getAsJsonObject("statusbar").has("background-color")) {
            try {
                int color = Color.parseColor(config.getAsJsonObject("statusbar").get("background-color").getAsString());
                ForgeViewController.setStatusBarColor(color, null);
            } catch (IllegalArgumentException e) {
                ForgeLog.e("Invalid color string for statusbar.background-color: " + e.getMessage());
            }
        }

        API.orientation_allowAny(null);
        if (config.has("orientations") && config.getAsJsonObject("orientations").has("android")) {
            String orientation = config.getAsJsonObject("orientations").get("android").getAsString();
            if (orientation.equals("portrait")) {
                API.orientation_forcePortrait(null);
            } else if (orientation.equals("landscape")) {
                API.orientation_forceLandscape(null);
            }
        }
    }

}
