//
//  OmdbMoviesListController.m
//  OmdbApp
//
//  Created by vivek on 05/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import "OmdbMoviesListController.h"
#import "Movie.h"


@interface OmdbMoviesListController ()

@end

@implementation OmdbMoviesListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBarHead.title = self.navigationTitle;
    self.moviesListTableView.delegate = self;
    self.moviesListTableView.dataSource = self;
    
    
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
    id secondVc = [storyboard instantiateViewControllerWithIdentifier:@"OmdbSearchController"];
    [self presentViewController:secondVc animated:YES completion:nil];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"mov";
    Movie *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if (cell == nil) {
        cell = (Movie *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    NSString *movieYearStr = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    [cell.movieYear setText: movieYearStr];
    [cell.movieTitle setText: @"Test MSg"];
    
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180.0;
}
@end


