//
//  ActivityDataModel.swift
//  Task
//
//  Created by Sarankumar on 11/02/18.
//  Copyright © 2018 Sarankumar. All rights reserved.
//

import Foundation
class ActivityDataModel: NSObject {
    
    var title: String? = nil
    var activityList: [Activity]? = []

    func getActivityList(completed: Done? =  nil) {
        activityList?.removeAll()
        ActivityService.getActivityList(withUrl: baseUrl, completionHandler: { (isSuccess, result, error) in
            if isSuccess {
                if let titleObj = result?["title"] as? String {
                    self.title = titleObj
                }
                if let activityListArray = result?["rows"] as? [[String: AnyObject]] {
                    for activity in activityListArray where activity.count > 0 {
                        self.activityList?.append(self.getActivityDetails(activityObj: activity))
                    }
                    completed?()
                }
                completed?()
            } else {
                completed?()
            }
        })
    }
    
    func activityListCount() -> Int {
        return (self.activityList != nil ? self.activityList!.count : 0)
    }
    func getactivityAtIndex(index: Int) -> Activity? {
        if index < self.activityList!.count {
            return self.activityList?[index]
        }
        return nil
    }

    func getActivityDetails(activityObj: [String: AnyObject]) -> Activity {
        let activity: Activity  = Activity(title: self.decodeData(key: "title", object: activityObj), descriptionText: self.decodeData(key: "description", object: activityObj), icon: self.decodeData(key: "imageHref", object: activityObj))
        return activity
    }
    
    //MARK:- Nil Checking
    func decodeData(key: String, object: [String: AnyObject]) -> String {
        guard let value = object[key] as? String else {
            return ""
        }
        return value
    }
    
    //MARK:- RESET
    func reset() {
        title = nil
        activityList = nil
    }
    
    deinit {
        print("ActivityDataModel Deinit")
        reset()
    }
}

class Activity: NSObject {
    var title: String?
    var descriptionText: String?
    var icon: String?
    init(title: String? = nil, descriptionText: String? = nil, icon: String? = nil) {
        self.title = title
        self.descriptionText = descriptionText
        self.icon = icon
    }
}
