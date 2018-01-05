//
//  OmdbMoviesListController.h
//  OmdbApp
//
//  Created by vivek on 05/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OmdbMoviesListController : UIViewController
- (IBAction)backButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBarHead;
@property (retain,nonatomic) NSString *navigationTitle;


@end
