forge['display'] = {
	'orientation': {
		'forcePortrait': function (success,error) {
			forge.internal.call("display.orientation_forcePortrait", {}, success, error);
		},
		'forceLandscape': function (success,error) {
			forge.internal.call("display.orientation_forceLandscape", {}, success, error);
		},
		'allowAny': function (success,error) {
			forge.internal.call("display.orientation_allowAny", {}, success, error);
		}
	},
	'statusbar': {
		'setStatusBarColour': function (text, success, error) {
			forge.internal.call("display.setStatusBarColour", {text: text}, success, error);
		}
	}
};