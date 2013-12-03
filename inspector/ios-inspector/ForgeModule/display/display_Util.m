//
//  display_Util.m
//  ForgeTemplate
//
//  Created by Connor Dunn on 28/08/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//

#import "display_Util.h"

NSString *allowedOrientations = nil;
@implementation display_Util

+ (BOOL)isAllowedOrientation:(NSString *)orientation {
	if (allowedOrientations == nil) {
		NSDictionary *config = [[ForgeApp sharedApp] configForPlugin:@"display"];
		if ([ForgeViewController isIPad]) {
			allowedOrientations = [[config objectForKey:@"orientations"] objectForKey:@"ipad"];
		} else {
			allowedOrientations = [[config objectForKey:@"orientations"] objectForKey:@"iphone"];
		}
		if (allowedOrientations == nil) {
			allowedOrientations = @"any";
		}
	}
	if ([allowedOrientations isEqualToString:@"any"]) {
		return YES;
	} else {
		return [allowedOrientations isEqualToString:orientation];
	}
}

+ (void)setAllowedOrientation:(NSString *)orientation {
	allowedOrientations = orientation;
	
	// Force orientation update
	dispatch_async(dispatch_get_main_queue(), ^{
		if ([[ForgeApp sharedApp] viewController].modalViewController == nil) {
			UIViewController *c = [[UIViewController alloc] init];
			
			[[[ForgeApp sharedApp] viewController] presentModalViewController:c animated:NO];
			[[[ForgeApp sharedApp] viewController] dismissModalViewControllerAnimated:NO];
		}
	});
}

@end
