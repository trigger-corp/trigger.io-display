/* global module, forge, asyncTest, askQuestion, ok, start */

module("forge.display");

if (forge.is.mobile()) {
	asyncTest("Wake lock enabled", 1, function() {
		forge.display.enableWakeLock(function () {
			askQuestion("Does the app go to sleep?", {
				Yes: function () {
					ok(false, "User claims failure");
					start();
				}, No: function () {
					ok(true, "User claims success");
					start();
				}
			});
		}, function (e) {
			ok(false, "Error: " + JSON.stringify(e));
		});
	});

	asyncTest("Wake lock disabled", 1, function() {
		forge.display.disableWakeLock(function () {
			askQuestion("Does the app go to sleep?", {
				Yes: function () {
					ok(true, "User claims success");
					start();
				}, No: function () {
					ok(false, "User claims failure");
					start();
				}
			});
		}, function (e) {
			ok(false, "Error: " + JSON.stringify(e));
		});
	});

	asyncTest("Initial orientation", 1, function() {
		askQuestion("Does the app rotate freely?", {Yes: function () {
			ok(true, "User claims success");
			start();
		}, No: function () {
			ok(false, "User claims failure");
			start();
		}});
	});

	asyncTest("Fullscreen", 1, function() {
		askQuestion("Is the app fullscreen?", {Yes: function () {
			ok(true, "User claims success");
			start();
		}, No: function () {
			ok(false, "User claims failure");
			start();
		}});
	});

	asyncTest("Force portrait", 1, function() {
		forge.display.orientation.forcePortrait(function () {
			askQuestion("Is it now limited to portrait?", { Yes: function () {
				ok(true, "User claims success");
				start();
			}, No: function () {
				ok(false, "User claims failure");
				start();
			}});
		}, function () {
			ok(false, "Error");
			start();
		});
	});
	asyncTest("Allow any", 1, function() {
		forge.display.orientation.allowAny(function () {
			askQuestion("Does it now rotate freely?", { Yes: function () {
				ok(true, "User claims success");
				start();
			}, No: function () {
				ok(false, "User claims failure");
				start();
			}});
		}, function () {
			ok(false, "Error");
			start();
		});
	});
	asyncTest("Set status bar background color from module config", 1, function() {
		askQuestion("Is the status bar red?", { Yes: function () {
			ok(true, "User claims success");
			start();
		}, No: function () {
			ok(false, "User claims failure");
			start();
		}});
	});
	asyncTest("Change status bar background color", 1, function() {
		forge.display.setStatusBarColor([0, 255, 0], function () {
			askQuestion("Did the status bar change color to green?", { Yes: function () {
				ok(true, "User claims success");
				start();
			}, No: function () {
				ok(false, "User claims failure");
				start();
			}});
		}, function () {
			ok(false, "Error");
			start();
		});
	});
}
