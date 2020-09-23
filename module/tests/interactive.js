/* global module, forge, asyncTest, askQuestion, ok, start */

module("forge.display");


asyncTest("Initial state of status bar", 1, function() {
    askQuestion("Is the status bar visible?", {
        Yes: function () {
            ok(true, "User claims success");
            start();
        }, No: function () {
            ok(false, "User claims failure");
            start();
        }
    });
});

asyncTest("Status bar hidden", 1, function() {
    forge.display.setStatusBarHidden(true, function () {
        askQuestion("Is the status bar hidden?", {
            Yes: function () {
                ok(true, "User claims success");
                start();
            }, No: function () {
                ok(false, "User claims failure");
                start();
            }
        });
    });
});

asyncTest("Status bar visible", 1, function() {
    forge.display.setStatusBarHidden(false, function () {
        askQuestion("Is the status bar visible?", {
            Yes: function () {
                ok(true, "User claims success");
                start();
            }, No: function () {
                ok(false, "User claims failure");
                start();
            }
        });
    });
});

if (forge.is.ios()) {
    asyncTest("Set status bar style UIStatusBarStyleLightContent, iOS", 1, function() {
        forge.display.setStatusBarStyle("UIStatusBarStyleLightContent", function () {
            askQuestion("Status bar should use light text", {
                Yes: function () {
                    ok(true, "User claims success");
                    start();
                },
                No: function () {
                    ok(false, "User claims failure");
                    start();
                }
            });
        }, function () {
            ok(true, "Not available");
            start();
        });
    });

    asyncTest("Set status bar style UIStatusBarStyleDarkContent, iOS", 1, function() {
        forge.display.setStatusBarStyle("UIStatusBarStyleDarkContent", function () {
            askQuestion("Status bar should use dark text", {
                Yes: function () {
                    ok(true, "User claims success");
                    start();
                },
                No: function () {
                    ok(false, "User claims failure");
                    start();
                }
            });
        }, function () {
            ok(true, "Not available");
            start();
        });
    });

    asyncTest("Set status bar style UIStatusBarStyleDefault, iOS", 1, function() {
        forge.display.setStatusBarStyle("UIStatusBarStyleDefault", function () {
            askQuestion("Status bar should use a text color appropriate for dark mode", {
                Yes: function () {
                    ok(true, "User claims success");
                    start();
                },
                No: function () {
                    ok(false, "User claims failure");
                    start();
                }
            });
        }, function () {
            ok(true, "Not available");
            start();
        });
    });
}

if (forge.is.android()) {
    asyncTest("Set status bar background color from module config", 1, function() {
        askQuestion("Is the status bar red?", {
            Yes: function () {
                ok(true, "User claims success");
                start();
            }, No: function () {
                ok(false, "User claims failure");
                start();
            }});
    });

    asyncTest("Change status bar background color", 1, function() {
        forge.display.setStatusBarColor([0, 255, 0], function () {
            askQuestion("Did the status bar change color to green?", {
                Yes: function () {
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

asyncTest("Status bar transparent", 1, function() {
    forge.display.setStatusBarTransparent(true, function () {
        askQuestion("Is the status bar transparent?", {
            Yes: function () {
                ok(true, "User claims success");
                start();
            }, No: function () {
                ok(false, "User claims failure");
                start();
            }
        });
    });
});

asyncTest("Status bar opaque", 1, function() {
    forge.display.setStatusBarTransparent(false, function () {
        askQuestion("Is the status bar opaque?", {
            Yes: function () {
                ok(true, "User claims success");
                start();
            }, No: function () {
                ok(false, "User claims failure");
                start();
            }
        });
    });
});


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
