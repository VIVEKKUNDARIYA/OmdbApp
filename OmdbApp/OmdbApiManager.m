//
//  OmdbApiManager.m
//  OmdbApp
//
//  Created by vivek on 08/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import "OmdbApiManager.h"
#import "OmdbNetworkManager.h"
#import "OmdbUtils.h"

@implementation OmdbApiManager
+   (void ) getSearchResultsForKeywords:(NSString *)searchText withResults:(void (^)(NSArray *, NSError *))responseHandler {
//[string appendString:textButtonText];
    //NSString *urlEncodedSearchText = [OmdbUtils URLEncodeString:searchText];
    //NSString *searchUrlStr = [NSString stringWithFormat:@"%@s=%@", baseUrl, urlEncodedSearchText];
    
    NSDictionary<NSString *, NSString *> *parameterDict = @{
                                                            @"s": searchText,
                                    };
    [OmdbNetworkManager doGet:parameterDict withResponseCallback: ^(NSDictionary *movieDict,NSError *error){
        if(error==nil)
        {
            responseHandler(movieDict[@"Search"],error);
        }
        responseHandler(nil,error);
        return ;
    }];
}
+   (void ) getSearchResultsForID:(NSString *)searchID withResults:(void (^)(NSDictionary *, NSError *))responseHandler {
    //[string appendString:textButtonText];
    //NSString *urlEncodedSearchText = [OmdbUtils URLEncodeString:searchText];
    //NSString *searchUrlStr = [NSString stringWithFormat:@"%@s=%@", baseUrl, urlEncodedSearchText];
    
    NSDictionary<NSString *, NSString *> *parameterDict = @{
                                                            @"i": searchID,
                                                            };
    [OmdbNetworkManager doGet:parameterDict withResponseCallback: ^(NSDictionary *movieDict,NSError *error){
        if(error==nil)
        {
            responseHandler(movieDict,error);
        }
        responseHandler(nil,error);
        return ;
    }];
}

@end
