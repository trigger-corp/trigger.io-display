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
	'setStatusBarColor': function (color, success, error) {
		forge.internal.call("display.setStatusBarColor", {color: color}, success, error);
	}
};