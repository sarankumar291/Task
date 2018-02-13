//
//  ViewControllerTests.m
//  TaskTests
//
//  Created by Sarankumar on 13/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

#import <XCTest/XCTest.h>

// Views
#import "ViewController.h"

@interface ViewControllerTests : XCTestCase
@property (nonatomic, strong) ViewController * viewController;
@end

@implementation ViewControllerTests

- (void)setUp {
    [super setUp];
    
    _viewController = [[ViewController alloc] init];
    _viewController.tableView = [[UITableView alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    _viewController = nil;
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

- (void)testOutlets {
    XCTAssertTrue(_viewController.tableView, @"TableView not initiated");
}

- (void)testRegisteredNibForTableViewCell {
    [_viewController.tableView registerClass:[ActivityTableViewCell class] forCellReuseIdentifier:@"cell"];
    ActivityTableViewCell *cell = [_viewController.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath: [NSIndexPath indexPathForRow:0 inSection:0]];
    XCTAssertTrue(cell,@"Cell should be an instance of ActivityTableViewCell");
}

- (void)testLoadTableView {
    [_viewController.tableView reloadData];
}

- (void)testTableViewDatasourceSetup {
    XCTAssertEqual(_viewController.tableView.numberOfSections, 1, @"TableView should have one section");
}

@end
