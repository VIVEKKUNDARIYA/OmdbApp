//
//  OmdbMovieController.h
//  OmdbApp
//
//  Created by vivek on 08/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OmdbMovieController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *moviesDetailsTableView;

- (IBAction)backButtonPressed:(id)sender;

@end
