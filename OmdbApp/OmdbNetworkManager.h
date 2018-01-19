//
//  OmdbNetworkManager.h
//  OmdbApp
//
//  Created by vivek on 05/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIImageView+AFNetworking.h>

@interface OmdbNetworkManager : NSObject

+ (void)doGet:(NSDictionary *)parameterDict withResponseCallback:(void (^)(NSDictionary *,NSError *))responseHandler;

@end
