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
    NSString *urlEncodedSearchText;
    
    if(parameterDict[@"s"]){
        urlEncodedSearchText = [NSString stringWithFormat:@"s=%@",[OmdbUtils URLEncodeString : parameterDict[@"s"]]];
    }
    else if(parameterDict[@"i"])
    {
        urlEncodedSearchText = [NSString stringWithFormat:@"i=%@",[OmdbUtils URLEncodeString : parameterDict[@"i"]]];
}
    NSString *searchUrlStr = [NSString stringWithFormat:@"%@%@", baseUrl, urlEncodedSearchText];
    
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
