//
//  ViewController.m
//  OmdbApp
//
//  Created by vivek on 03/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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
    NSLog(@"Search Button pressed %@",self.searchBoxContents.text);
}

@end
