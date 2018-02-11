//
//  UIViewController+Helper.swift
//  Task
//
//  Created by Sarankumar on 11/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIViewController {
    func showLoader(withTitle title: String? = nil, withDesc desc: String? = nil) {
        DispatchQueue.main.async {
            let loader: MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
            loader.bezelView.backgroundColor = .TabbarGray
            loader.contentColor = .white
            loader.mode = .indeterminate
            loader.label.text = title ?? ""
            loader.detailsLabel.text = desc ?? ""
            loader.show(animated: true)
        }
    }
    func hideLoader() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
