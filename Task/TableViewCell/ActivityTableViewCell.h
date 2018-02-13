//
//  ActivityTableViewCell.h
//  Task
//
//  Created by Sarankumar on 12/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

#import <UIKit/UIKit.h>
// FrameWorks
#import <SDWebImage/UIImageView+WebCache.h>
// Views
#import "Constants.h"
#import "Activity.h"

@interface ActivityTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIImageView *displayImageView;
@property (nonatomic, strong) UIView *bottomLine;

- (void)configureCell:(Activity *)activity;
@end
