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
@synthesize viewController = _viewController;

- (void)setUp {
    [super setUp];
    
    _viewController = [[ViewController alloc] init];
    [_viewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    [_viewController view];
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

//MARK:- View loading tests
-(void)testThatViewLoads {
    XCTAssertNotNil(_viewController.view, @"View  initiated properly");
}

- (void)testParentViewHasTableViewSubview {
    NSArray *subviews = _viewController.view.subviews;
    XCTAssertFalse([subviews containsObject:_viewController.tableView], @"View does not have a table subview");
}

- (void)testOutlets {
    XCTAssertNil(_viewController.tableView, @"TableView not initiated");
}

//MARK:- UITableView tests
- (void)testThatViewConformsToUITableViewDataSource {
    XCTAssertTrue([_viewController conformsToProtocol:@protocol(UITableViewDataSource) ], @"View does not conform to UITableView datasource protocol");
}

- (void)testRegisteredNibForTableViewCell {
    [_viewController.tableView registerClass:[ActivityTableViewCell class] forCellReuseIdentifier:@"cell"];
    ActivityTableViewCell *cell = [_viewController.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath: [NSIndexPath indexPathForRow:0 inSection:0]];
    XCTAssertNil(cell,@"Cell should be an instance of ActivityTableViewCell");
}

- (void)testLoadTableView {
    [_viewController.tableView reloadData];
}

- (void)testTableViewDatasourceSetup {
    XCTAssertEqual(_viewController.tableView.numberOfSections, 0, @"TableView should have one section");
}

@end
