//
//  ViewController.h
//  Task
//
//  Created by Sarankumar on 12/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

#import <UIKit/UIKit.h>
// FrameWorks
#import "MBProgressHUD.h"
// Models
#import "ActivityDataModel.h"
// Extensions
#import "UIColor+Extension.h"
// Views
#import "ActivityTableViewCell.h"

@interface ViewController: UIViewController<UITableViewDataSource, ActivityDataModelDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ActivityDataModel * activityDataModel;
@property (nonatomic) UIRefreshControl *refreshControl;
- (void)loadActivities;
@end

