//
//  OmdbApiManager.h
//  OmdbApp
//
//  Created by vivek on 08/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OmdbApiManager : NSObject
+   (void ) getSearchResultsFor:(NSString *)searchUrlStr withResults:(void (^)(NSArray *, NSError *))responseHandler;

@end
