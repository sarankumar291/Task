//
//  ActivityService.swift
//  Task
//
//  Created by Sarankumar on 11/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

import Foundation

class ActivityService {
    class func getActivityList(withUrl url: String, completionHandler: @escaping CompletionHandler) {
        TaskService.request(url, method: .get, headersType: .App) { (isSuccess, result, error) in
            completionHandler(isSuccess, result, error)
        }
    }
}
