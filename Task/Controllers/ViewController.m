//
//  ViewController.m
//  Task
//
//  Created by Sarankumar on 12/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize tableView = _tableView;
@synthesize activityDataModel = _activityDataModel;
@synthesize refreshControl = _refreshControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setupView];
    [self setupRefreshView];
    // Do any additional setup after loading the view, typically from a nib.
}

//MARK:- View UI & Activity API added
- (void)setupView {
    // View Color & naviagtion bar color changed
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor theme];
    self.navigationController.navigationBar.tintColor = [UIColor navBarTint];
    NSDictionary * navigationAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize: navigationBarFontSize weight: UIFontWeightSemibold], NSForegroundColorAttributeName: [UIColor navBarTint]};
    self.navigationController.navigationBar.titleTextAttributes = navigationAttributes;
    // Activity data model allocated & called API
    _activityDataModel = [[ActivityDataModel alloc] init];
    _activityDataModel.delegate = self;
    [self loadActivities];
}

//MARK:- TableView & Constraints added
- (void)setupTableView {
    _tableView = [[UITableView alloc] initWithFrame: self.view.safeAreaLayoutGuide.layoutFrame];
    _tableView.dataSource = self;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview: _tableView];
    // Register table view cells
    [_tableView registerClass:[ActivityTableViewCell class] forCellReuseIdentifier:@"cell"];
    // Added Constraints
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *tableViewTopConstraint = [_tableView.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor];
    NSLayoutConstraint *tableViewLeadingConstraint = [_tableView.leadingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.leadingAnchor];
    NSLayoutConstraint *tableViewTrailingConstraint = [_tableView.trailingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.trailingAnchor];
    NSLayoutConstraint *tableViewBottomConstraint = [_tableView.bottomAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.bottomAnchor];
    [self.view addConstraints: @[tableViewTopConstraint, tableViewLeadingConstraint,  tableViewTrailingConstraint, tableViewBottomConstraint]];
}

//MARK:- Refresh tableView method
- (void)setupRefreshView {
    _refreshControl = [[UIRefreshControl alloc]init];
    _refreshControl.tintColor = [UIColor theme];
    [_tableView addSubview:_refreshControl];
    [_refreshControl addTarget:self action:@selector(loadActivities) forControlEvents:UIControlEventValueChanged];
}

- (void)loadActivities {
    //TODO: refresh your data
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_activityDataModel getActivity];
    [_refreshControl endRefreshing];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK:- TableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_activityDataModel activityListCount];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Activity * activity = [_activityDataModel.activityList objectAtIndex: indexPath.row];
    [cell configureCell: activity];
    return cell;
}

//MARK:- Delegate method of API call
- (void)completionHandler:(BOOL)isSuccess {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.navigationItem.title = _activityDataModel.title;
        [_tableView reloadData];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

@end
