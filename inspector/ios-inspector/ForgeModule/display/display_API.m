//
//  display_API.m
//  ForgeTemplate
//
//  Created by Connor Dunn on 28/08/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//

#import "display_API.h"
#import "display_Util.h"

@implementation display_API

+ (void)orientation_forcePortrait:(ForgeTask*)task {
	[display_Util setAllowedOrientation:@"portrait" completion:^{
        [task success:nil];
    }];

}

+ (void)orientation_forceLandscape:(ForgeTask*)task {
	[display_Util setAllowedOrientation:@"landscape" completion:^{
        [task success:nil];
    }];
}

+ (void)orientation_allowAny:(ForgeTask*)task {
	[display_Util setAllowedOrientation:@"any" completion:^{
        [task success:nil];
    }];
}

+ (void)setWakeLock:(ForgeTask*)task enabled:(NSNumber*)enabled{
    [[UIApplication sharedApplication] setIdleTimerDisabled:[enabled boolValue]];
    [task success:nil];
}

@end
