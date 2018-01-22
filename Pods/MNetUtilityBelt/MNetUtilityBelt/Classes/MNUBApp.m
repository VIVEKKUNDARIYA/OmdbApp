//
//  MNUBApp.m
//  MNetUtilityBelt
//
//  Created by vivek on 11/01/18.
//

#import "MNUBApp.h"

@implementation MNUBApp

+ (NSString *)getAppVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)getAppBuild {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)getAppPackageName{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

@end
