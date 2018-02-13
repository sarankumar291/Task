//
//  ActivityDataModel.m
//  Task
//
//  Created by Sarankumar on 13/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

#import "ActivityDataModel.h"

@implementation ActivityDataModel

@synthesize title = _title;
@synthesize activityList = _activityList;
@synthesize delegate = _delegate;

- (id)init {
    self = [super init];
    _activityList = [[NSMutableArray alloc] init];
    return self;
}

//MARK:- Calling API
- (void)getActivity {
    TaskService *taskService = [[TaskService alloc] init];
    taskService.delegate = self;
    [taskService getActivity];
}

//MARK:- Delegate Method of API call
- (void)getActivityDetails:(NSDictionary *)data {
    NSArray *dataArray = [data objectForKey:@"rows"];
    for (NSDictionary *subDictionary in dataArray) {
        [_activityList addObject: [self getActivityData: subDictionary]];
    }
    _title = [data objectForKey:@"title"];
    [_delegate completionHandler: YES];
}

//MARK:- Number of rows in section count
- (NSInteger)activityListCount {
    return _activityList.count;
}

//MARK:- Get object of the particular row
- (Activity *)getactivityAtIndex: (NSInteger)index {
    return [_activityList objectAtIndex: index];
}

- (Activity *)getActivityData:(NSDictionary *)receivedObjects {
    Activity * activity = [[Activity alloc] init];
    activity.headLine = [self checkEmptyString: [receivedObjects valueForKey:@"title"]];
    activity.descriptionText = [self checkEmptyString: [receivedObjects valueForKey:@"description"]];
    activity.imageURL = [self checkEmptyString: [receivedObjects valueForKey:@"imageHref"]];
    return activity;
}

//MARK:- Check empty string
- (NSString *)checkEmptyString:(NSString *)value {
    if ([value isKindOfClass: [NSNull class]] || value.length == 0) {
        return @"";
    }
    else {
        return value;
    }
}
@end
