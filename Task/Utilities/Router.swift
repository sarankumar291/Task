//
//  Router.swift
//  Task
//
//  Created by Sarankumar on 11/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

import Foundation
import UIKit

let AppDelegateInstance = UIApplication.shared.delegate as! AppDelegate

class Router {
    class func loadHomeScreen() {
        AppDelegateInstance.window = UIWindow(frame:UIScreen.main.bounds)
        let mainViewController = ViewController()
        let navController = UINavigationController(rootViewController: mainViewController)
        AppDelegateInstance.window?.addSubview(navController.view)
        AppDelegateInstance.window?.rootViewController = navController
        AppDelegateInstance.window?.makeKeyAndVisible()
    }
}
