//
//  OmdbNetworkManager.m
//  OmdbApp
//
//  Created by vivek on 05/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import "OmdbNetworkManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation OmdbNetworkManager

+ (void)doGet:(NSString *)url withResponseCallback:(void (^)(NSArray *))responseHandler{
    NSArray *movieList ;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                         @"application/json",
                                                         @"text/html",
                                                         @"text/json",
                                                         nil];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    id respObject = nil;
    [manager GET:url parameters:respObject progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:&jsonError];
        //NSString *htmlString = [NSString stringWithUTF8String:[responseObject bytes]];
        NSArray *movieList = [json objectForKey:@"Search"];
        NSLog(@"array: %@", movieList);
        responseHandler(movieList);
        NSLog(@"Done!");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Done!");
        responseHandler(nil);
    }];
    
}
+ (void)doGetParticularID:(NSString *)url withResponseCallback:(void (^)(NSDictionary *))responseHandler{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                         @"application/json",
                                                         @"text/html",
                                                         @"text/json",
                                                         nil];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    id respObject = nil;
    [manager GET:url parameters:respObject progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:&jsonError];
        //NSString *htmlString = [NSString stringWithUTF8String:[responseObject bytes]];
        
        responseHandler(json);
        NSLog(@"Done!");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Done!");
        responseHandler(nil);
    }];
    
}

@end
