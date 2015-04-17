package io.trigger.forge.android.modules.display;

import io.trigger.forge.android.core.ForgeApp;
import io.trigger.forge.android.core.ForgeParam;
import io.trigger.forge.android.core.ForgeTask;
import android.content.pm.ActivityInfo;
import android.graphics.Color;
import android.os.Build;
import android.view.Window;
import android.view.WindowManager;

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
	public static void setStatusBarColour(final ForgeTask task, @ForgeParam("text") final String bgColour) {
		ForgeApp.getActivity().runOnUiThread(new Runnable() {
        public void run() {
        	if (bgColour.length() == 0) {
        		task.error("invalid bgColour string: zero length");
        		return;
        	}
        	int colourInt = -1;
        	try {
        		colourInt = Color.parseColor(bgColour);
        	}
        	catch (IllegalArgumentException e) {
        		task.error("invalid bgColour string: " + bgColour + " valid e.g. '#ffff00'");
        		return;
        	}
        	if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        	    Window window = ForgeApp.getActivity().getWindow();
        	    window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        	    window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
        	    window.setStatusBarColor(colourInt);
        	}
        }
		});
		if (task != null) {
			task.success();
		}
	}

}

