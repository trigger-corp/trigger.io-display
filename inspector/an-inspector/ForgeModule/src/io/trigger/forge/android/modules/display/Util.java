package io.trigger.forge.android.modules.display;

import io.trigger.forge.android.core.ForgeApp;
import io.trigger.forge.android.core.ForgeLog;
import android.os.Build;
import android.view.Window;
import android.view.WindowManager;

public class Util {
	public static void setStatusBarColor(final int color) {
		ForgeApp.getActivity().runOnUiThread(new Runnable() {
			public void run() {
				if (Build.VERSION.SDK_INT >= 21 /* Build.VERSION_CODES.LOLLIPOP */) {
					Window window = ForgeApp.getActivity().getWindow();
					window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
					window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
					window.setStatusBarColor(color);
				} else {
					ForgeLog.w("display.statusbar.setStatusBarColor() is only supported on Android 5.0 or higher");
				}
			}
		});
	}
}
