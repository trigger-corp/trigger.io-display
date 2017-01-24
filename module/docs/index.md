``display``: App display options
================================

The ``forge.display`` namespace allows you to control how your app will be displayed as the device is moved
around.

The default is to allow for any orientation, with the content being re-drawn as the screen is rotated.

##Config options

###Fullscreen

Android, iOS 5 & 6
:	If set to true, the system statusbar will be hidden: your app will run completely fullscreen on the device.

iOS 7+
:   * `not-fullscreen`: equivalent to non-fullscreen operation on iOS 5 or 6; the statusbar is shown and has a background which can be customised with the [topbar](/modules/topbar/current/) module.
	* `no-statusbar`: equivalent to fullscreen operation on iOS 5 or 6: the statusbar is not shown at all
	* `webview-under-statusbar`: your app covers the full screen (as with `no-statusbar`), but the statusbar information is shown floating over it with a higher z-index.

###Orientations

iPhone, iPad, Android
:	Set the default orientation lock on a per platform basis.
	These options can be set to any of `"any"`, `"portrait"` or `"landscape"` to limit the orientations usable by the app.

###Statusbar

Background Color
:   Enter an RGB color string, e.g. `"#FFFF00"` to set the color of the status bar. (Android 5.0+ only)

##API

The ``display`` module also allows you to change the orientation
limitations while your app is running with the following API.

!method: forge.display.orientation.forceLandscape(success, error)
!param: success `function(value)` callback to be invoked when no errors occur
!description: Force the app into a landscape orientation.
!platforms: iOS, Android
!param: error `function(content)` called with details of any error which may occur

!method: forge.display.orientation.forcePortrait(success, error)
!param: success `function(value)` callback to be invoked when no errors occur
!description: Force the app into a portrait orientation.
!platforms: iOS, Android
!param: error `function(content)` called with details of any error which may occur

!method: forge.display.orientation.allowAny(success, error)
!param: success `function(value)` callback to be invoked when no errors occur
!description: Allow any app orientation.
!platforms: iOS, Android
!param: error `function(content)` called with details of any error which may occur

!method: forge.display.setStatusBarColor(color, success, error)
!description: Set the status bar color.
!platforms: Android 5.0+
!param: color `array` an array of three integers in the range [0,255] that make up the RGB color of the topbar. For example, opaque red is [255, 0, 0].
!param: success `function(value)` callback to be invoked when no errors occur
!param: error `function(content)` called with details of any error which may occur

!method: forge.display.enableWakeLock(success, error)
!description: Prevent the device from entering sleep mode and disabling the display when your app is active.
!platforms: iOS, Android
!param: success `function(value)` callback to be invoked when no errors occur
!param: error `function(content)` called with details of any error which may occur

!method: forge.display.disableWakeLock(success, error)
!description: Remove any active wake lock preventing the device from entering sleep mode when your app is active.
!platforms: iOS, Android
!param: success `function(value)` callback to be invoked when no errors occur
!param: error `function(content)` called with details of any error which may occur
