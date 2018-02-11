//
//  ViewController+DataSource.swift
//  Task
//
//  Created by Sarankumar on 11/02/18.
//  Copyright © 2018 Sarankumar. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityDataModel!.activityListCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ActivityTableVIewCell else {
            return UITableViewCell()
        }
        let activity = activityDataModel?.getactivityAtIndex(index: indexPath.row)
        cell.configureCell(object: activity)
        return cell
    }
}
