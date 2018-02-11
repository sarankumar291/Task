//
//  UIColor+Helper.swift
//  Task
//
//  Created by Sarankumar on 11/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    @nonobjc class var TabbarGray: UIColor {
        return UIColor(red: 60.0 / 255.0, green: 65.0 / 255.0, blue: 79.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var Theme: UIColor {
        return UIColor(red: 248.0 / 255.0, green: 208.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var backButtonTint: UIColor {
        return self.white
    }
    @nonobjc class var navTitleTint: UIColor {
        return self.white
    }
    @nonobjc class var navBarTint: UIColor {
        return self.white // icon(back and icons) nav tint
    }
    @nonobjc class var bottomLine: UIColor {
        return self.lightGray
    }
}
