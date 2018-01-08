//
//  OmdbNetworkManager.m
//  OmdbApp
//
//  Created by vivek on 05/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import "OmdbNetworkManager.h"
#import <AFNetworking/AFNetworking.h>
#import "OmdbUtils.h"
NSString const *baseUrl = @"https://www.omdbapi.com/?apikey=d062a57d&";

@implementation OmdbNetworkManager

+ (void)doGet:(NSDictionary *)parameterDict withResponseCallback:(void (^)(NSDictionary *, NSError * error))responseHandler{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                         @"application/json",
                                                         @"text/html",
                                                         @"text/json",
                                                         nil];
    
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    NSString *searchTerm;
    if(parameterDict[@"s"])
        searchTerm = parameterDict[@"s"];
    else if(parameterDict[@"i"])
        searchTerm = parameterDict[@"i"];
    NSString *urlEncodedSearchText = [OmdbUtils URLEncodeString:searchTerm];
    NSString *searchUrlStr = [NSString stringWithFormat:@"%@s=%@", baseUrl, urlEncodedSearchText];
    
    [manager GET:searchUrlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:&jsonError];
        responseHandler(json,jsonError);
        NSLog(@"Done!");
    } failure:^(NSURLSessionDataTask * task, NSError *error) {
        NSLog(@"Done!");
        responseHandler(nil,error);
    }];
    
}

@end
