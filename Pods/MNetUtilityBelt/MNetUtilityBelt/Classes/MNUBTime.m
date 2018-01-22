//
//  MNUBTime.m
//  MNetUtilityBelt
//
//  Created by vivek on 12/01/18.
//

#import "MNUBTime.h"

@implementation MNUBTime

+ (NSNumber *)getTimeStampMillis{
    return [NSNumber numberWithLong:[[NSDate date] timeIntervalSince1970] *1000];
}

+ (NSString *)getTimeStampMillisString{
   
    return [[self getTimeStampMillis] stringValue];;
}

+ (NSNumber *)getTimeStamp{
    return [NSNumber numberWithLong:[[NSDate date] timeIntervalSince1970]];
}

+ (NSString *)getTimeStampString{
    return [[self getTimeStamp] stringValue];;
}

+ (NSNumber *)getFreeDiskSpace{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error=nil;
    NSDictionary *attr = [fm attributesOfFileSystemForPath:@"/" error:&error];
    long val = 0 ;
    if(error ==nil)
    {
        val = (long)attr[@"NSFileSystemFreeSize"];
    }
    return [NSNumber numberWithLong:val];
}
@end
