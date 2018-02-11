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
    
    private func  setupTableView() {
        tableView = UITableView()
        tableView.register(ActivityTableVIewCell.self, forCellReuseIdentifier: "cell")// register cell name
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.tableView.addSubview(refreshControl)
        tableView.separatorStyle = .none
        let safeView = view.safeAreaLayoutGuide
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let leadingConstraint = tableView.leadingAnchor.constraint(equalTo: safeView.leadingAnchor)
        let trailingConstraint = tableView.trailingAnchor.constraint(equalTo: safeView.trailingAnchor)
        let topConstraint = tableView.topAnchor.constraint(equalTo: safeView.topAnchor)
        let bottomConstraint = tableView.bottomAnchor.constraint(equalTo: safeView.bottomAnchor)
        view.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
    
    @objc func loadActivities() {
        activityDataModel?.getActivityList(completed: {
            self.hideLoader()
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

