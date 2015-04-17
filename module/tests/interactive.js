module("forge.display");

if (forge.is.mobile()) {
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
	asyncTest("Change status bar background colour", 1, function() {
		forge.display.statusbar.setStatusBarColour("#ff00ff", function () {
			askQuestion("Did the status bar change colour?", { Yes: function () {
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
