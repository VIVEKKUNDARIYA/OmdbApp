//
//  MNUBManager.h
//  MNetUtilityBelt
//
//  Created by vivek on 17/01/18.
//

#import <Foundation/Foundation.h>

@interface MNUBManager : NSObject

/// This function enables or disables the Console Logging.
/// if consoleLog is YES, enables the Logging
/// else NO, disables the Logging.
+ (void)setConsoleLogging:(BOOL) consoleLog;

@end

void MNUBLog(NSString *format, ...);
