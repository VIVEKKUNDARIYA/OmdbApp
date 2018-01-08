//
//  OmdbUtils.h
//  OmdbApp
//
//  Created by vivek on 08/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OmdbUtils : NSObject
+ (NSString *)sanitizeSearchText:(NSString *)searchText;
+ (NSString *)URLEncodeString: (NSString *) string ;
@end
