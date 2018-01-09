//
//  OmdbMovieController.h
//  OmdbApp
//
//  Created by vivek on 08/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OmdbMovieController : UIViewController 

@property (weak, nonatomic) IBOutlet UITableView *moviesDetailsTableView;
@property (strong,nonatomic) NSDictionary *movieJson;
- (IBAction)backButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIView *detailingView;

@end
