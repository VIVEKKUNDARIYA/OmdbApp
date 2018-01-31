//
//  MNUBString.m
//  MNetUtilityBelt
//
//  Created by vivek on 10/01/18.
//

#import "MNUBString.h"
#import <CommonCrypto/CommonDigest.h>
#import "MNUBTaskManager.h"

@implementation MNUBString

+ (NSString *)removeExtraSpacesBetweenWord:(NSString *)string{
    NSMutableArray *stringArray = [[string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] mutableCopy];
    [stringArray removeObject:@""];
    string = [stringArray componentsJoinedByString:@" "];
    return string;
}

+ (NSString *)trim:(NSString *)string{
    return [string stringByTrimmingCharactersInSet:
     [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)URLEncodeString: (NSString *) string {
    static CFStringRef charset = CFSTR("!@#$%&*()+'\";:=,/?[] ");
    CFStringRef str = (__bridge CFStringRef)string;
    CFStringEncoding encoding = kCFStringEncodingUTF8;
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, str, NULL, charset, encoding));
}

+ (NSString *)URLDecodeString: (NSString *) string {
    static CFStringRef charset = CFSTR("");
    CFStringRef str = (__bridge CFStringRef)string;
    CFStringEncoding encoding = kCFStringEncodingUTF8;
    return (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, str,  charset, encoding));
}

+ (NSString *) MD5Hash:(NSString *)string{
    const char* str = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (unsigned int)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}
+ (BOOL) isEmptyString:(NSString *) string{
    return string == nil || [string isEqualToString:@""];
}
+ (BOOL) isValidURL:(NSString *)string{
    NSURL *urlAddress = [NSURL URLWithString:string];
    return urlAddress != nil && [self isEmptyString:urlAddress.scheme]==NO && [self isEmptyString:urlAddress.host]==NO;
}

+ (BOOL) isHttpURL:(NSString *)string{
    return [self isValidURL:string] && [[NSURL URLWithString:string].scheme isEqualToString:@"http" ];
}

+ (BOOL) isHttpsURL:(NSString *)string{
    return [self isValidURL:string] && [[NSURL URLWithString:string].scheme isEqualToString:@"https" ];
}

+ (void) regexMatchingInTimeLimit:(NSString *)string
                          pattern:(NSString *)regex
                        timeLimit:(double)timeLimit
                       withResult:(void (^)(BOOL))resultHandler
{
    __block BOOL taskCompletion = NO;
    MNUBTaskManager *task = [[MNUBTaskManager alloc] init];
    [task performTask:timeLimit task:^{
            NSError *regexError = nil;
            NSRegularExpression *regexExpression = [NSRegularExpression regularExpressionWithPattern:regex options:kNilOptions error:&regexError];
            if(regexError != nil)
            {
                taskCompletion = YES;
                resultHandler(NO);
            }
            NSRange range =NSMakeRange(0, string.length);
            BOOL result = [regexExpression firstMatchInString:string options:kNilOptions range:range]!=nil;
            @synchronized(self){
                if(taskCompletion == YES){
                    return;
                }
                taskCompletion=YES;
                resultHandler(result);
            }
        
        }
       callbackMethod:^(NSError* error) {
            @synchronized(self){
                if(taskCompletion == YES){
                    return;
                }
                taskCompletion=YES;
                resultHandler(NO);
            }
    }];
}

@end
