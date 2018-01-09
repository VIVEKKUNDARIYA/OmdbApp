//
//  MovieDetailsTableViewCell.h
//  OmdbApp
//
//  Created by vivek on 09/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+dynamicSizeMe.h"
@interface MovieDetailsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *movieDetailsHeading;
@property (weak, nonatomic) IBOutlet UILabel *movieDetailsValue;

@end
