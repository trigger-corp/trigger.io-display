package io.trigger.forge.android.modules.display;

import com.google.gson.JsonObject;

import android.os.Build;
import android.os.Bundle;
import io.trigger.forge.android.core.ForgeApp;
import io.trigger.forge.android.core.ForgeEventListener;

public class EventListener extends ForgeEventListener {
	@Override
	public void onCreate(Bundle savedInstanceState) {
		JsonObject config = ForgeApp.configForPlugin("display");
		
		if (config.has("fullscreen") && config.getAsJsonObject("fullscreen").has("android") && config.getAsJsonObject("fullscreen").get("android").getAsBoolean()) {
			if (Build.VERSION.SDK_INT < Build.VERSION_CODES.HONEYCOMB_MR2) {
				ForgeApp.getActivity().setTheme(android.R.style.Theme_NoTitleBar_Fullscreen);
			} else {
				ForgeApp.getActivity().setTheme(android.R.style.Theme_Holo_Light_NoActionBar_Fullscreen);
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
