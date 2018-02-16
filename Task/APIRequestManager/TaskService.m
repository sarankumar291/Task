//
//  TaskService.m
//  Task
//
//  Created by Sarankumar on 13/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

#import "TaskService.h"

@implementation TaskService

- (void)stringWithUrl:(NSURL *)url callback:(void (^)(NSDictionary *returnResponse, BOOL success))callback {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask * dataTask = [session dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            callback(nil, NO);
        } else {
            NSString *encodingString = [[NSString alloc] initWithData: data encoding: NSISOLatin1StringEncoding];
            NSData *encodingData = [encodingString dataUsingEncoding: NSUTF8StringEncoding];
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData: encodingData options:NSJSONReadingMutableContainers error: &error];
            callback(jsonDict, YES);
        }
    }];
    [dataTask resume];
}


@end
