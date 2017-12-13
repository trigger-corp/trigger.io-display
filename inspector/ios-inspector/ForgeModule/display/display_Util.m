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


+ (void)setAllowedOrientation:(NSString *)orientation completion:(void (^__nullable)(void))completion {
	allowedOrientations = orientation;

	dispatch_async(dispatch_get_main_queue(), ^{
        if ([display_Util isAllowedOrientation:@"any"]) {
            // do nothing
        } else if ([display_Util isAllowedOrientation:@"portrait"]) {
            NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
            [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
        } else if ([display_Util isAllowedOrientation:@"landscape"]) {
            NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
            [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
        }
        completion();
	});
}

@end
