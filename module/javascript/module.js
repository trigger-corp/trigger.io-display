/* global forge */

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

    'enableWakeLock': function (success, error) {
        forge.internal.call("display.setWakeLock", { enabled: true }, success, error);
    },
    'disableWakeLock': function (success, error) {
        forge.internal.call("display.setWakeLock", { enabled: false }, success, error);
    },

    'setStatusBarColor': function (color, success, error) {
        forge.internal.call("layout.setStatusBarColor", { color: color }, success, error);
    },
    'setStatusBarHidden': function (hidden, success, error) {
        forge.internal.call("layout.setStatusBarHidden", { hidden: hidden }, success, error);
    },
    'setStatusBarTransparent': function (transparent, success, error) {
        forge.internal.call("layout.setStatusBarTransparent", { transparent: transparent }, success, error);
    },
    'setStatusBarStyle': function (style, success, error) {
        forge.internal.call("layout.setStatusBarStyle", { style: style }, success, error);
    }
};
