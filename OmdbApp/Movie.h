//
//  Movie.h
//  OmdbApp
//
//  Created by vivek on 05/01/18.
//  Copyright © 2018 vivek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Movie : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UILabel *movieYear;

@end
