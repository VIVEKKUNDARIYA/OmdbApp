//
//  OmdbMovieController.m
//  OmdbApp
//
//  Created by vivek on 08/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import "OmdbMovieController.h"

@interface OmdbMovieController ()

@end

@implementation OmdbMovieController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButtonPressed:(id)sender {
    //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //id thirdVc = [storyboard instantiateViewControllerWithIdentifier:@"OmdbMoviesListController"];
    //secondVc.navigationTitle =searchText;
    //secondVc.movieFinalList = movieList;
    [self dismissViewControllerAnimated:YES completion:nil];
    //[self presentViewController:secondVc animated:YES completion:nil];
    NSLog(@"DONE");
}
@end
