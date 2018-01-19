//
//  OmdbUtils.m
//  OmdbApp
//
//  Created by vivek on 08/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import "OmdbUtils.h"

@implementation OmdbUtils
+ (NSString *)sanitizeSearchText:(NSString *)searchText{
    searchText = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSMutableArray *textButtonTextArray = [[searchText componentsSeparatedByString:@" "] mutableCopy];
    [textButtonTextArray removeObject:@""];
    searchText = [textButtonTextArray componentsJoinedByString:@" "];
    return searchText;
}
+ (NSString *)URLEncodeString: (NSString *) string {
    static CFStringRef charset = CFSTR("!@#$%&*()+'\";:=,/?[] ");
    CFStringRef str = (__bridge CFStringRef)string;
    CFStringEncoding encoding = kCFStringEncodingUTF8;
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, str, NULL, charset, encoding));
}

@end
