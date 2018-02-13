//
//  TaskServiceTests.m
//  TaskTests
//
//  Created by Sarankumar on 13/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

#import <XCTest/XCTest.h>
// Extensions
#import "WebServiceURLs.h"

@interface TaskServiceTests : XCTestCase
@end

@implementation TaskServiceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testWebService {
    // Initialize necessary objects
    NSURLSession *session = [NSURLSession sharedSession];
    // Execute test
    XCTestExpectation *expectation = [self expectationWithDescription:@"API call async"];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString: baseURL] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        XCTAssertNil(error, @"dataTaskWithURL error %@", error);
        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
            XCTAssertEqual(statusCode, 200, @"status code was not 200; was %ld", (long)statusCode);
        }
        XCTAssert(data, @"data nil");
        // do additional tests on the contents of the `data` object here, if you want
        // when all done, Fulfill the expectation
        [expectation fulfill];
        
    }];
    [dataTask resume];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

@end
