//
//  MNUBTaskManager.m
//  MNetUtilityBelt
//
//  Created by vivek on 18/01/18.
//

#import "MNUBTaskManager.h"
#import "MNUBConstants.h"

@interface MNUBTaskManager()

@property (nonatomic) void(^responseCb)(NSError *);

@end

@implementation MNUBTaskManager

- (BOOL) performTask : (double) timeLimit
                task : (void (^)(void))task
      callbackMethod : (void (^)(NSError *))timeOutCallBack
{
    if(timeLimit <= 0)
    {
        NSDictionary *userInfoError =@{
                                       NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
                                       NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Invalid time given", nil),
                                       };
        NSError *timeLimitError = [[NSError alloc] initWithDomain:@"timeout" code:TIMELIMIT_ERRORCODE userInfo:userInfoError];
        
        timeOutCallBack(timeLimitError);
        return NO;
    }
    self.responseCb = timeOutCallBack;
    void(^task_dispatcher)(void) = ^(void){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            task();
        });
        [NSTimer scheduledTimerWithTimeInterval:timeLimit
                                         target:self
                                       selector:@selector(timerCalled:)
                                       userInfo:nil
                                        repeats:NO
         ];
    };
    if([NSThread isMainThread] == YES){
        task_dispatcher();
    }else{
        dispatch_sync(dispatch_get_main_queue(), task_dispatcher);
    }
    return YES;
}

- (void)timerCalled:(NSTimer *)timer{
    if(self.responseCb==nil)
    {
        return;
    }
    NSDictionary *userInfoError =@{
                                   NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"The operation timed out.", nil),
                                };
    NSError *error = [[NSError alloc] initWithDomain:@"timeout" code:TIMEOUT_ERRORCODE userInfo:userInfoError];
    self.responseCb(error);
}

@end
