//
//  MNUBApp.h
//  MNetUtilityBelt
//
//  Created by vivek on 11/01/18.
//

#import <Foundation/Foundation.h>

@interface MNUBApp : NSObject

/// This method returns the Application version number as string.
+ (NSString *)getAppVersion;

/// This method returns the Application build number as string.
+ (NSString *)getAppBuild;

/// This method returns the Application build number as string.
+ (NSString *)getAppPackageName;

@end
