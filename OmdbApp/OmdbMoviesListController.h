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
@property (weak, nonatomic) IBOutlet UITableView *moviesListTableView;
@property (strong,nonatomic) NSArray *movieFinalList;
@end

