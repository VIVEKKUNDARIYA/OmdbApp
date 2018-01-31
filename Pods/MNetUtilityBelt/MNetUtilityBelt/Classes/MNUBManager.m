//
//  MNUBManager.m
//  MNetUtilityBelt
//
//  Created by vivek on 17/01/18.
//

#import "MNUBManager.h"

static BOOL consoleLogging = NO; /// variable for controlling the Logging

@implementation MNUBManager

+ (void) setConsoleLogging:(BOOL) consoleLog {
    consoleLogging = consoleLog;
}
@end

void MNUBLog(NSString *format, ...){
    if(consoleLogging==NO)
    {
        return;
    }
    va_list args;
    va_start(args, format);
    NSLogv(format, args);
    va_end(args);
}

