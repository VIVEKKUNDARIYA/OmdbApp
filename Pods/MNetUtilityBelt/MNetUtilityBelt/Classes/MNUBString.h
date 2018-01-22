//
//  MNUBString.h
//  MNetUtilityBelt
//
//  Created by vivek kundariya on 10/01/18.
//

#import <Foundation/Foundation.h>

@interface MNUBString : NSObject

/// This method removes extra whitespace
/// entered between two words of the given string.
+ (NSString *)removeExtraSpacesBetweenWord:(NSString *)string;

/// This method removes leading and trailing whitespaces
/// from the given string.
+ (NSString *)trim:(NSString *)string;

/// This method encodes the string into URL format.
+ (NSString *)URLEncodeString: (NSString *)string;

/// This method decodes the string into URL format.
+ (NSString *)URLDecodeString: (NSString *) string;

/// This method converts the given string to MD5 Hash
+ (NSString *)MD5Hash:(NSString *)string;

/// This method verifies the given string is URL or not
+ (BOOL)isValidURL:(NSString *)string;

/// This method verifies the given string is http URL or NOT
+ (BOOL)isHttpURL:(NSString *)string;

/// This method verifies the given string is https URL or NOT
+ (BOOL)isHttpsURL:(NSString *)string;

/// This method checks whether the given string is empty or not.
/// In case if string is nil, will return YES.
+ (BOOL) isEmptyString:(NSString *) string;

/// This method matches the regex for given timeLimit.
/// If the regex matching completed in the given timeLimit returns
/// the result of matching. Else will return NO.
+ (void) regexMatchingInTimeLimit:(NSString *)string
                          pattern:(NSString *)regex
                        timeLimit:(double)timeLimit
                       withResult:(void (^)(BOOL))resultHandler;

@end
