//
//  OmdbMoviesListController.h
//  OmdbApp
//
//  Created by vivek on 05/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OmdbMoviesListController : UIViewController <UITableViewDelegate, UITableViewDataSource>

- (IBAction)backButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBarHead;
@property (strong,nonatomic) NSString *navigationTitle;
@property (weak,nonatomic) NSMutableArray *imageLinks;
@property (weak,nonatomic) NSMutableArray *names;
@property (weak,nonatomic) NSMutableArray *years;
@property (weak, nonatomic) IBOutlet UITableView *moviesListTableView;


@end


@interface Movie : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UILabel *movieYear;


@end
