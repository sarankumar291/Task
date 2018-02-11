//
//  AppStyleSettings.swift
//  Task
//
//  Created by Sarankumar on 11/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

import UIKit

class AppStyleSettings {
    
    class func setup() {
        UIBarButtonItem.appearance().setTitleTextAttributes([ NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular), NSAttributedStringKey.foregroundColor: UIColor.backButtonTint], for:UIControlState())
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor.navBarTint // for text color
        UINavigationBar.appearance().barTintColor = UIColor.Theme // for bar background
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold), NSAttributedStringKey.foregroundColor: UIColor.navTitleTint]
        UIApplication.shared.statusBarStyle = .lightContent
    }
}

