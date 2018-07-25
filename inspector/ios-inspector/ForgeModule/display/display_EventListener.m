//
//  display_EventListener.m
//  ForgeTemplate
//
//  Created by Connor Dunn on 28/08/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "display_EventListener.h"
#import "display_Util.h"

@implementation display_EventListener


+ (void)application:(UIApplication *)application postDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	NSDictionary* config = [[ForgeApp sharedApp] configForPlugin:@"display"];

	// statusbar.ios.transparent
	if ([[[config objectForKey:@"statusbar"] objectForKey:@"ios"] objectForKey:@"transparent"]) {
		BOOL transparent = [[[[config objectForKey:@"statusbar"] objectForKey:@"ios"] objectForKey:@"transparent"] boolValue];
		ForgeApp.sharedApp.viewController.statusBarHidden = transparent;
	}

	// statusbar.ios.hidden
	if ([[[config objectForKey:@"statusbar"] objectForKey:@"ios"] objectForKey:@"hidden"]) {
		BOOL hidden = [[[[config objectForKey:@"statusbar"] objectForKey:@"ios"] objectForKey:@"hidden"] boolValue];
		ForgeApp.sharedApp.viewController.statusBarHidden = hidden;
		if (hidden) {
			ForgeApp.sharedApp.viewController.statusBarTransparent = YES;
		}

	// DEPRECATED: fullscreen.ios7 - renamed to statusbar.ios.hidden
	} else if ([[[config objectForKey:@"fullscreen"] objectForKey:@"ios7"] isEqualToString:@"no-statusbar"]) {
		ForgeApp.sharedApp.viewController.statusBarHidden = YES;
		ForgeApp.sharedApp.viewController.statusBarTransparent = YES;
	}

	NSLog(@"1");

	// statusbar.ios.style
	if ([[[config objectForKey:@"statusbar"] objectForKey:@"ios"] objectForKey:@"style"]) {
		NSLog(@"2");
		NSString *style = [[[config objectForKey:@"statusbar"] objectForKey:@"ios"] objectForKey:@"style"];
		NSLog(@"3");
		if ([style isEqualToString:@"light_content"] || [style isEqualToString:@"UIStatusBarStyleLightContent"]) {
			NSLog(@"3a");
			ForgeApp.sharedApp.viewController.statusBarStyle = UIStatusBarStyleLightContent;
		} else if ([style isEqualToString:@"default"] ||[style isEqualToString:@"UIStatusBarStyleDefault"]) {
			NSLog(@"3b");
			ForgeApp.sharedApp.viewController.statusBarStyle = UIStatusBarStyleDefault;
		}
		NSLog(@"4");
	}
	NSLog(@"5");


}


+ (NSNumber*)supportedInterfaceOrientations {
	if ([display_Util isAllowedOrientation:@"any"]) {
		return [NSNumber numberWithInt:UIInterfaceOrientationMaskAll];
	} else if ([display_Util isAllowedOrientation:@"portrait"]) {
		return [NSNumber numberWithInt:UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown];
	} else if ([display_Util isAllowedOrientation:@"landscape"]) {
		return [NSNumber numberWithInt:UIInterfaceOrientationMaskLandscape];
	} else {
		return nil;
	}
}


+ (NSNumber*)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	BOOL portrait = interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown;
	BOOL landscape = interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight;

	if (portrait) {
		return [NSNumber numberWithBool:[display_Util isAllowedOrientation:@"portrait"]];
	} else if (landscape) {
		return [NSNumber numberWithBool:[display_Util isAllowedOrientation:@"landscape"]];
	} else {
		return nil;
	}
}

@end
