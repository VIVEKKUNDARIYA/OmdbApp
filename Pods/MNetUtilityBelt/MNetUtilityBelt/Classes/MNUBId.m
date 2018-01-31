//
//  MNUBId.m
//  MNetUtilityBelt
//
//  Created by vivek on 12/01/18.
//

#import "MNUBId.h"

@implementation MNUBId

+ (NSString *)generateUUID{
    return [[NSUUID UUID] UUIDString];
}
@end
