//
//  TaskService.h
//  Task
//
//  Created by Sarankumar on 13/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

#import <Foundation/Foundation.h>

//Constants
#import "WebServiceURLs.h"

@protocol ServiceDelegate <NSObject>

@required

- (void)getActivityDetails:(NSDictionary *)data;

@end

@interface TaskService : NSObject

@property (nonatomic, weak) id<ServiceDelegate> delegate;
- (void)getActivity;

@end
