//
//  MNUBMisc.m
//  MNetUtilityBelt
//
//  Created by vivek on 15/01/18.
//

#import "MNUBMisc.h"

@implementation MNUBMisc
+ (void)swizzleMethod:(id)class
     originalSelector:(SEL)originalSelector
     swizzledSelector:(SEL)swizzledSelector
{
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
}

+ (NSArray *)getReservedPrefix{
    static NSArray <NSString *>*prefixArray;
    static dispatch_once_t onceToken;
    //Prefix Array has been taken from this link http://nshipster.com/namespacing/
    dispatch_once(&onceToken, ^(void){
                                prefixArray=@[
                                            @"AB", @"AC", @"AD", @"AL", @"AU", @"AV", @"CA",
                                            @"CB", @"CF", @"CG", @"CI", @"CL", @"CM", @"CV",
                                            @"EA", @"EK", @"GC", @"GLK", @"JS", @"MA", @"MC",
                                            @"MF", @"MIDI", @"MK", @"MP", @"NK", @"NS", @"PK",
                                            @"QL", @"SC", @"Sec", @"SK", @"SL", @"SS", @"TW",
                                            @"UI", @"UT"
                                            ];
                                }
                  );
    return prefixArray;
}

+ (BOOL)containsReservedPrefix: (NSString *)string{
    NSArray *prefixArray = [self getReservedPrefix];
    NSString *re = [NSString stringWithFormat:@"^(%@)[A-Z][a-z]",[prefixArray componentsJoinedByString:@"|"]];
    NSError *regexError=nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:re options:kNilOptions error:&regexError];
    if(regexError ==nil)
        return NO;
    NSRange range =NSMakeRange(0, string.length);
    return ([regex firstMatchInString:string options:kNilOptions range:range]!=nil);
}

@end
