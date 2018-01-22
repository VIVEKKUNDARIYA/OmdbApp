//
//  MNUBIO.h
//  MNetUtilityBelt
//
//  Created by vivek on 15/01/18.
//

#import <Foundation/Foundation.h>

@interface MNUBFileManager : NSObject
/// This method checks whether the file or directory exist
/// or not at the give filePath.
+ (BOOL) doesFileExistAtPath:(NSString *)filepath;

/// This method returns the support directory path
+ (NSString *)getSupportDirectoryPath;

/// This method returns the content of file at filePath. It returns if
/// file can't be opened or exists.
+ (NSString *)readFromFile:(NSString *)filePath;

/// This method create and write the content to file at filePath.
/// It overwrite the contents if file exists at filepath
/// It returns NO, if writing fails. Returns YES  for success.
+ (BOOL)writeToFile:(NSString *)filePath
       withContents:(NSString *)content;

@end
