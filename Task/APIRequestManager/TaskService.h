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

@interface TaskService : NSObject

- (void)stringWithUrl:(NSURL *)url callback:(void (^)(NSDictionary *returnResponse, BOOL success))callback;


@end
