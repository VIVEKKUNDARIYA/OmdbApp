//
//  MNUBTime.h
//  MNetUtilityBelt
//
//  Created by vivek on 12/01/18.
//

#import <Foundation/Foundation.h>

@interface MNUBTime : NSObject

/// This method returns the Time Stamp in milli seconds from 1 January 1970 as NSNumber
+ (NSNumber *)getTimeStampMillis;

/// This method returns the Time Stamp in milli seconds from 1 January 1970 as string
+ (NSString *)getTimeStampMillisString;

/// This method returns the Time Stamp in seconds from 1 January 1970 as NSNumber
+ (NSNumber *)getTimeStamp;

/// This method returns the Time Stamp in seconds from 1 January 1970 as string
+ (NSString *)getTimeStampString;

/// This method returns free disk space as NSNumber
+ (NSNumber *)getFreeDiskSpace;
@end
