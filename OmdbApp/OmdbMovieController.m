//
//  OmdbMovieController.m
//  OmdbApp
//
//  Created by vivek on 08/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import "OmdbMovieController.h"
#import "MovieDetailsTableViewCell.h"
@interface OmdbMovieController ()

@end

@implementation OmdbMovieController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.moviesDetailsTableView.delegate = self;
    self.moviesDetailsTableView.dataSource = self;
    
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
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"movieDetails";
    MovieDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = (MovieDetailsTableViewCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if(indexPath.row==0)
    {
        [cell.movieDetailsValue setText:@"Harry ignores warnings not to return to Hogwarts, only to find the school plagued by a series of mysterious attacks and a strange voice haunting him."];
        [cell.movieDetailsValue resizeToFit];
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


@end
