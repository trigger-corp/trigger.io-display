``display``: App display options
================================

The ``forge.display`` namespace allows you to control how your app will be displayed as the device is moved
around.

The default is to allow for any orientation, with the content being re-drawn as the screen is rotated.

## Config options

### Statusbar

#### Android

Hidden
:   Sets Android status bar visibility on supported devices.

Transparent
:   Sets Android status bar transparency on supported devices.

Background Color
:   Enter an RGB color string, e.g. `"#FFFF00"` to set the color of the status bar. (Android 5.0+ only)

#### iOS

Hidden
:   Sets iOS status bar visibility.

Transparent
:   Sets iOS status bar transparency.

Style
:  Sets the status bar style on iOS: `UIStatusBarStyleDefault` will use black text if iOS dark mode is disabled. If dark mode is enabled the text color will be controlled by iOS. `UIStatusBarStyleLightContent` will use light text. `UIStatusBarStyleDarkContent` will use dark text irrespective of iOS dark mode settings.


### Orientations

iPhone, iPad, Android
:	Set the default orientation lock on a per platform basis.
    These options can be set to any of `"any"`, `"portrait"` or `"landscape"` to limit the orientations usable by the app.


## API

The ``display`` module also allows you to change the orientation
limitations while your app is running with the following API.

!method: forge.display.setStatusBarHidden(hidden, success, error)
!description: Sets status bar visibility on supported devices.
!platforms: iOS, Android
!param: hidden `bool` The status bar is hidden when set to `true` and visible when set to `false`.
!param: success `function(value)` callback to be invoked when no errors occur
!param: error `function(content)` called with details of any error which may occur

!method: forge.display.setStatusBarTransparent(transparent, success, error)
!description: Sets status bar transparency on supported devices.
!platforms: iOS, Android
!param: transparent `bool` The status bar is transparent when set to `true` and opaque when set to `false`.
!param: success `function(value)` callback to be invoked when no errors occur
!param: error `function(content)` called with details of any error which may occur

!method: forge.display.setStatusBarColor(color, success, error)
!description: Set status bar color on supported devices.
!platforms: Android 5.0+
!param: color `array` an array of three integers in the range [0,255] that make up the RGB color of the statusbar. For example, opaque red is [255, 0, 0].
!param: success `function(value)` callback to be invoked when no errors occur
!param: error `function(content)` called with details of any error which may occur

!method: forge.display.setStatusBarStyle(style, success, error)
!platforms: iOS
!param: style `string` either ``"default`` or ``"light_content"``.
!param: success `function()` callback to be invoked when no errors occur
!param: error `function(content)` called with details of any error which may occur
!description: Set the status bar style on iOS, `default` will use black text, `light_content` will use white text.

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
