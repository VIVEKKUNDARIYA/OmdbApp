//
//  OmdbMovieController.m
//  OmdbApp
//
//  Created by vivek on 08/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import "OmdbMovieController.h"
#import "UIImageView+AFNetworking.h"
#import "UILabel+dynamicSizeMe.h"
@interface OmdbMovieController ()

@end

@implementation OmdbMovieController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *ImageURL = self.movieJson[@"Poster"];
    
    [self.backgroundImageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:ImageURL]] placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        [self.backgroundImageView setImage:image];
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
    }];
    [self.movieName setText:self.movieJson[@"Title"]];
    [self.movieIMDBRating setText:[NSString stringWithFormat:@"%@/10", self.movieJson[@"imdbRating"]]];
    [self.timeAndGenre setText:[NSString stringWithFormat:@"%@ | %@", self.movieJson[@"Runtime"],self.movieJson[@"Genre"]]];
    [self.directorDetails setText:self.movieJson[@"Director"]];
    [self.releaseDate setText:self.movieJson[@"Released"]];
    [self.moviePlot setText:self.movieJson[@"Plot"]];
    [self.moviePlot resizeToFit];
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

     
