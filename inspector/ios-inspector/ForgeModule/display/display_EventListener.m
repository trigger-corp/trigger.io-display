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

+ (void)application:(UIApplication *)application preDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	NSDictionary* config = [[ForgeApp sharedApp] configForPlugin:@"display"];
	if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
		if ([[[config objectForKey:@"fullscreen"] objectForKey:@"ios7"] isEqualToString:@"no-statusbar"]) {
			[ForgeApp sharedApp].webviewTop -= 20;
		}
	} else {
		if ([[[config objectForKey:@"fullscreen"] objectForKey:@"ios"] boolValue]) {
			[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
		}
	}
}

+ (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	NSDictionary* config = [[ForgeApp sharedApp] configForPlugin:@"display"];
	if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
		if (![[[config objectForKey:@"fullscreen"] objectForKey:@"ios7"] isEqualToString:@"not-fullscreen"]) {
			[[ForgeApp sharedApp] hideStatusBarBox];
			if (NSClassFromString(@"WKWebView") && [[ForgeApp sharedApp] useWKWebView]) {
				WKWebView *webView = (WKWebView*)[[ForgeApp sharedApp] webView];
				UIEdgeInsets inset = webView.scrollView.contentInset;
				UIEdgeInsets newInset = UIEdgeInsetsMake(inset.top - 20.0, inset.left, inset.bottom, inset.right);
				[webView.scrollView setContentInset:newInset];
				[webView.scrollView setScrollIndicatorInsets:newInset];
			} else {
				UIWebView *webView = (UIWebView*)[[ForgeApp sharedApp] webView];
				UIEdgeInsets inset = webView.scrollView.contentInset;
				UIEdgeInsets newInset = UIEdgeInsetsMake(inset.top - 20.0, inset.left, inset.bottom, inset.right);
				[webView.scrollView setContentInset:newInset];
				[webView.scrollView setScrollIndicatorInsets:newInset];
			}
		}
	}
}

+ (NSNumber *)prefersStatusBarHidden {
	NSDictionary* config = [[ForgeApp sharedApp] configForPlugin:@"display"];
	if ([[[config objectForKey:@"fullscreen"] objectForKey:@"ios7"] isEqualToString:@"no-statusbar"]) {
		return @YES;
	}
	return nil;
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
