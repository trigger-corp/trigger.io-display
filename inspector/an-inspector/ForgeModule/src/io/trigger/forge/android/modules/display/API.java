package io.trigger.forge.android.modules.display;

import com.google.gson.JsonArray;

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
	public static void setStatusBarColor(final ForgeTask task, @ForgeParam("color") final JsonArray colorArray) {
		if (colorArray.size() != 3) {
			task.error("invalid color array, expecting: [r, g, b]");
			return;
		}
		int color = Color.rgb(colorArray.get(0).getAsInt(), colorArray.get(1).getAsInt(), colorArray.get(2).getAsInt());
		Util.setStatusBarColor(color);
		task.success();
	}
}

