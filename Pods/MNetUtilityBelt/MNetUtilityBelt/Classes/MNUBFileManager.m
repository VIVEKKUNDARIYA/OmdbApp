//
//  MNUBFileManager.m
//  MNetUtilityBelt
//
//  Created by vivek on 15/01/18.
//

#import "MNUBFileManager.h"
#import "MNUBManager.h"

@implementation MNUBFileManager
+ (BOOL) doesFileExistAtPath:(NSString *)filepath{
    return  [[NSFileManager defaultManager] fileExistsAtPath:filepath isDirectory:nil];
}

+ (NSString *)getSupportDirectoryPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *applicationSupportDirectory = [paths firstObject];
    BOOL directoryStatus = [self doesFileExistAtPath:applicationSupportDirectory];
    if(directoryStatus == YES)
    {
        return applicationSupportDirectory;
    }
    NSError *error=nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:applicationSupportDirectory
                                   withIntermediateDirectories:YES
                                                    attributes:nil
                                                    error:&error];
    if(error == nil)
    {
        return applicationSupportDirectory;
    }
    MNUBLog(@"Unable to create support Directory. %@",[error localizedDescription]);
    return nil;
}

+ (NSString *)readFromFile:(NSString *)filePath{
    NSError *error=nil;
    NSString *content=  [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if(error != nil)
    {
        MNUBLog(@"ReadFile failed %@",[error localizedDescription]);
        return nil;
    }
    return content;
}

+ (BOOL)writeToFile:(NSString *)filePath
       withContents:(NSString *)content{
    NSError * error=nil;
    BOOL result =[content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if(error != nil)
    {
        MNUBLog(@"writing to %@ failed %@",filePath,[error localizedDescription]);
        return NO;
    }
    return result;
}

@end
