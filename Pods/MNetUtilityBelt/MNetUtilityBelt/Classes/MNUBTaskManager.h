//
//  MNUBTaskManager.h
//  MNetUtilityBelt
//
//  Created by vivek on 18/01/18.
//

#import <Foundation/Foundation.h>

@interface MNUBTaskManager : NSObject

/// This method performs the task in the given timeLimit
/// After completion of task or timeLimit, calls the callback block
- (BOOL) performTask : (double) timeLimit
                task : (void (^)(void))task
      callbackMethod : (void (^)(NSError *))timeOutCallBack;

@end
