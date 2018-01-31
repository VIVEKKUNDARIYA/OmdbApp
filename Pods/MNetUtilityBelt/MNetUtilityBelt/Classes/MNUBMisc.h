//
//  MNUBMisc.h
//  MNetUtilityBelt
//
//  Created by vivek on 15/01/18.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface MNUBMisc : NSObject

/// This method perform the method swizzling between originalSelector
/// And swizzledSelector.
+ (void)swizzleMethod:(id)class
    originalSelector:(SEL)originalSelector
    swizzledSelector:(SEL)swizzledSelector;

/// This method returns an array of reserved prefixes
+ (NSArray *)getReservedPrefix;

/// This method return YES if the given string is a reserved class.
/// else NO.
+ (BOOL)containsReservedPrefix: (NSString *)string;

@end
