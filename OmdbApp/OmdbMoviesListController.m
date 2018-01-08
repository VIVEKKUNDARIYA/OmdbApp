//
//  OmdbMoviesListController.m
//  OmdbApp
//
//  Created by vivek on 05/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import "OmdbMoviesListController.h"
#import "Movie.h"
#import "OmdbNetworkManager.h"

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
    [cell.movieYear setText: self.movieFinalList[indexPath.row][@"Year"]];
    [cell.movieTitle setText: self.movieFinalList[indexPath.row][@"Title"]];
    
    
    NSString *ImageURL = self.movieFinalList[indexPath.row][@"Poster"];
    
    
    //
    //[cell.imageView setImageWithURL :[NSURL URLWithString: ImageURL] ];//    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
   // cell.imageView.image = [UIImage imageWithData:imageData];
    //
    
    //
    [cell.image setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:ImageURL]] placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        [cell.image setImage:image];
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        // pass
    }];
    //
    
    //[UIImage imageWithContentsOfURL : self.movieFinalList[indexPath.row][@"Poster"]];
    cell.outerView.layer.cornerRadius = 8;
    cell.outerView.layer.masksToBounds = YES;
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canFocusRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableString *string = [NSMutableString stringWithString:@"https://www.omdbapi.com/?apikey=d062a57d&i="];
    //NSLog(@"%@",indexPath.length);
    [string appendString:@"tt0066999"];
    [OmdbNetworkManager doGetParticularID:string withResponseCallback: ^(NSDictionary *movieDetails){
        NSLog(@"%@",movieDetails);
        NSLog(@"DONE");
    }];
    NSLog(@"Selected!");
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


