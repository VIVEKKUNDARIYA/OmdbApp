//
//  OmdbSearchController.m
//  OmdbApp
//
//  Created by vivek on 03/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import "OmdbSearchController.h"
#import "OmdbMoviesListController.h"
#import "OmdbApiManager.h"
#import "OmdbUtils.h"
@interface OmdbSearchController ()

@end


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
    self.searchBoxContents.text =@"";
    searchText = [OmdbUtils sanitizeSearchText:searchText];
    
    if([searchText isEqualToString:@""]){
        NSLog(@"Empty String given");
        [self popUpMessage:@"Movie name not entered"];
    }

    self.searchButton.userInteractionEnabled =NO;
    NSLog(@"Search Button pressed %@",searchText);
    
    
    //
    
    [OmdbApiManager getSearchResultsFor:searchText withResults:^(NSArray *movieList,NSError *error){
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
    //[string appendString:textButtonText];
    
    self.searchButton.userInteractionEnabled =YES;
    
}

@end
