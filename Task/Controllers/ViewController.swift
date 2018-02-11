//
//  ViewController.swift
//  Task
//
//  Created by Sarankumar on 11/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activityDataModel: ActivityDataModel? = ActivityDataModel()
    internal var tableView: UITableView!
    
    // MARK: Refresh control
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.Theme
        refreshControl.addTarget(self, action: #selector(loadActivities), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setupView()
    }
    
    //MARK:- View UI & Activity API added
    private func setupView() {
        self.view.backgroundColor = UIColor.white
        self.showLoader()
        activityDataModel?.getActivityList(completed: {
            self.hideLoader()
            DispatchQueue.main.async {
                self.title = self.activityDataModel?.title
                self.tableView.reloadData()
            }
        })
    }
    
    //MARK:- TableView & Constraints added
    private func  setupTableView() {
        tableView = UITableView()
        // Register table view cells
        tableView.register(ActivityTableVIewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        self.view.addSubview(tableView)
        // Added refresh controller
        self.tableView.addSubview(refreshControl)
        tableView.separatorStyle = .none
        // Added Constraints
        let safeView = view.safeAreaLayoutGuide
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let leadingConstraint = tableView.leadingAnchor.constraint(equalTo: safeView.leadingAnchor)
        let trailingConstraint = tableView.trailingAnchor.constraint(equalTo: safeView.trailingAnchor)
        let topConstraint = tableView.topAnchor.constraint(equalTo: safeView.topAnchor)
        let bottomConstraint = tableView.bottomAnchor.constraint(equalTo: safeView.bottomAnchor)
        view.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
    
    //MARK:- Refresh tableView method
    @objc func loadActivities() {
        activityDataModel?.getActivityList(completed: {
            DispatchQueue.main.async {
                if self.refreshControl.isRefreshing {
                    self.refreshControl.endRefreshing()
                }
                self.title = self.activityDataModel?.title
                self.tableView.reloadData()
            }
        })
    }
    
    deinit {
        print("ViewController Deinit")
        activityDataModel = nil
    }
}

