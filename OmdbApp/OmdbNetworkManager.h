//
//  OmdbNetworkManager.h
//  OmdbApp
//
//  Created by vivek on 05/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OmdbNetworkManager : NSObject

+ (void)doGet:(NSString *)url withResponseCallback:(void (^)(NSArray *))responseHandler;

@end
