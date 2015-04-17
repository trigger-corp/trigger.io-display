package io.trigger.forge.android.modules.display;

import io.trigger.forge.android.core.ForgeApp;
import io.trigger.forge.android.core.ForgeTask;
import android.content.pm.ActivityInfo;
import android.os.Build;

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
                whatever nefarious thing you're doin'
        }
});
	}

}

