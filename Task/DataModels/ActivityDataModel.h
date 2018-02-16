//
//  ActivityDataModel.h
//  Task
//
//  Created by Sarankumar on 13/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

#import <Foundation/Foundation.h>

//Models
#import "Activity.h"
#import "TaskService.h"

@protocol ActivityDataModelDelegate <NSObject>

@required

- (void)completionHandler:(BOOL)isSuccess;

@end


@interface ActivityDataModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSMutableArray  *activityList;
@property (nonatomic, weak) id<ActivityDataModelDelegate> delegate;
- (void)getActivity;
- (NSInteger )activityListCount;
@end
