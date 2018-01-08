//
//  OmdbSearchController.m
//  OmdbApp
//
//  Created by vivek on 03/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import "OmdbSearchController.h"
#import "OmdbMoviesListController.h"
#import "OmdbNetworkManager.h"
@interface OmdbSearchController ()

@end

NSString const *baseUrl = @"https://www.omdbapi.com/?apikey=d062a57d&";

@implementation OmdbSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBoxContents becomeFirstResponder ];
    self.searchBoxContents.autocorrectionType = UITextAutocorrectionTypeNo;
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)sanitizeSearchText:(NSString *)searchText{
    searchText = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSMutableArray *textButtonTextArray = [[searchText componentsSeparatedByString:@" "] mutableCopy];
    [textButtonTextArray removeObject:@""];
    searchText = [textButtonTextArray componentsJoinedByString:@" "];
    return searchText;
}
- (NSString *)URLEncodeString: (NSString *) string {
    static CFStringRef charset = CFSTR("!@#$%&*()+'\";:=,/?[] ");
    CFStringRef str = (__bridge CFStringRef)string;
    CFStringEncoding encoding = kCFStringEncodingUTF8;
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, str, NULL, charset, encoding));
}
- (void) popUpMessage:(NSString *)msg{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Result"
                                 message:msg
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    
    
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   return;
                               }];
    [alert addAction : noButton];
    [self presentViewController:alert animated:YES completion:nil];
    return ;
}


- (IBAction)searchButtonPressed:(id)sender {
    NSString *searchText = self.searchBoxContents.text;
    [self.searchButton setTitle:@"Loading" forState:self]  ;
    searchText = [self sanitizeSearchText:searchText];
    
    if([searchText isEqualToString:@""]){
        NSLog(@"Empty String given");
        [self popUpMessage:@"Movie name not entered"];
    }

    self.searchButton.userInteractionEnabled =NO;
    NSLog(@"Search Button pressed %@",searchText);
    
    NSString *urlEncodedSearchText = [self URLEncodeString:searchText];
    NSString *searchUrlStr = [NSString stringWithFormat:@"%@s=%@", baseUrl, urlEncodedSearchText];
    
    //
    
    [OmdbApiManager getSearchResultsFor:searchUrlStr withResults:^(NSArray *moviesList){
        
    }];
    //[string appendString:textButtonText];
    [OmdbNetworkManager doGet:searchUrlStr withResponseCallback: ^(NSArray *movieList){
        NSLog(@"%@",movieList);
        //return movieList;
        if(movieList==nil)
        {
            [self popUpMessage:@"No movie found"];
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        OmdbMoviesListController *secondVc = [storyboard instantiateViewControllerWithIdentifier:@"OmdbMoviesListController"];
        
        secondVc.navigationTitle =searchText;
        secondVc.movieFinalList = movieList;
        [self presentViewController:secondVc animated:YES completion:nil];
        NSLog(@"DONE");
    }];
    self.searchButton.userInteractionEnabled =YES;
    
}

@end
