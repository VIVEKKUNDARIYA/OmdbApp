//
//  OmdbSearchController
//  OmdbApp
//
//  Created by vivek on 03/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OmdbSearchController : UIViewController
- (IBAction)searchButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *searchBoxContents;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;


@end

