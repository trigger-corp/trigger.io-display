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

// workaround for iOS 11 bug that does not update UI metrics during didFinishLaunchingWithOptions
static long insetAdjustmentBehavior;

@implementation display_EventListener


+ (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	insetAdjustmentBehavior = ForgeApp.sharedApp.viewController.contentInsetAdjustmentBehavior;
	NSDictionary* config = [[ForgeApp sharedApp] configForPlugin:@"display"];
	if ([[[config objectForKey:@"fullscreen"] objectForKey:@"ios7"] isEqualToString:@"no-statusbar"]) {
		ForgeApp.sharedApp.viewController.statusBarHidden = YES;
		// force update screen metrics
		ForgeApp.sharedApp.viewController.contentInsetAdjustmentBehavior = ForgeContentInsetAdjustmentNever;
	}
}


+ (void)firstWebViewLoad {
	// restore configured inset value
	ForgeApp.sharedApp.viewController.contentInsetAdjustmentBehavior = insetAdjustmentBehavior;
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
