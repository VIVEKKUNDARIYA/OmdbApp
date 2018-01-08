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

@implementation OmdbSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)searchButtonPressed:(id)sender {
    NSString *textButtonText = self.searchBoxContents.text;
    
    if([textButtonText isEqualToString:@""]){
        NSLog(@"Empty String given");
    }
    else{
        textButtonText = [textButtonText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSMutableArray *textButtonTextArray = [[textButtonText componentsSeparatedByString:@" "] mutableCopy];
        [textButtonTextArray removeObject:@""];
        textButtonText = [textButtonTextArray componentsJoinedByString:@" "];
        NSLog(@"Search Button pressed %@",textButtonText);
        
        
        NSMutableString *string = [NSMutableString stringWithString:@"https://www.omdbapi.com/?apikey=d062a57d&s="];
        
        [string appendString:textButtonText];
        [OmdbNetworkManager doGet:string withResponseCallback: ^(NSArray *movieList){
            NSLog(@"%@",movieList);
            //return movieList;
            if(movieList==nil)
            {
                UIAlertController * alert = [UIAlertController
                                             alertControllerWithTitle:@"Movie"
                                             message:@"No Movie Found"
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
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            
            OmdbMoviesListController *secondVc = [storyboard instantiateViewControllerWithIdentifier:@"OmdbMoviesListController"];
            
            secondVc.navigationTitle =textButtonText;
            secondVc.movieFinalList = movieList;
            [self presentViewController:secondVc animated:YES completion:nil];
            NSLog(@"DONE");
        }];
        
        
        
        
        
        
    }
}

@end
