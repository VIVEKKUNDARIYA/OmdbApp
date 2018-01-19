//
//  OmdbMoviesListController.m
//  OmdbApp
//
//  Created by vivek on 05/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import "OmdbMoviesListController.h"
#import "Movie.h"
#import "OmdbApiManager.h"
#import "OmdbMovieController.h"
#import "UIImageView+AFNetworking.h"

@interface OmdbMoviesListController ()

@end

@implementation OmdbMoviesListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBarHead.title = self.navigationTitle;
    
    self.moviesListTableView.delegate = self;
    self.moviesListTableView.dataSource = self;
    //__block NSMutableArray *movieFinalList = [[NSMutableArray alloc] init];
    
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
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    id firstVc = [storyboard instantiateViewControllerWithIdentifier:@"OmdbSearchController"];
    [self presentViewController:firstVc animated:YES completion:nil];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"mov";
    Movie *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if (cell == nil) {
        cell = (Movie *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    [cell.movieYear setText: self.movieFinalList[indexPath.row][@"Year"]];
    [cell.movieTitle setText: self.movieFinalList[indexPath.row][@"Title"]];
    
    
    NSString *ImageURL = self.movieFinalList[indexPath.row][@"Poster"];
    
    [cell.image setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:ImageURL]] placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        [cell.image setImage:image];
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        
    }];
    
    cell.outerView.layer.cornerRadius = 8;
    cell.outerView.layer.masksToBounds = YES;
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canFocusRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Selected!");
    NSString *idd =self.movieFinalList[indexPath.row][@"imdbID"];
    [OmdbApiManager getSearchResultsForID:idd withResults:^(NSDictionary *movieDetails , NSError *error) {
        if(error==nil)
        {
            NSLog(@"%@",movieDetails);
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            OmdbMovieController *thirdVc = [storyboard instantiateViewControllerWithIdentifier:@"OmdbMovieController"];
            thirdVc.movieJson = movieDetails;
            [self presentViewController:thirdVc animated:YES completion:nil];
           
        }
        
    }];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.movieFinalList count];
}

/*- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180.0;
}*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150.0;
}
@end


