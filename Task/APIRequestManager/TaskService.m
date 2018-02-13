//
//  TaskService.m
//  Task
//
//  Created by Sarankumar on 13/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

#import "TaskService.h"

@implementation TaskService
@synthesize delegate = _delegate;

- (void)getActivity {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString: baseURL] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *encodingString = [[NSString alloc] initWithData: data encoding: NSISOLatin1StringEncoding];
        NSData *encodingData = [encodingString dataUsingEncoding: NSUTF8StringEncoding];
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData: encodingData options:NSJSONReadingMutableContainers error: &error];
        [_delegate getActivityDetails: jsonDict];
    }];
    [dataTask resume];
}

@end
