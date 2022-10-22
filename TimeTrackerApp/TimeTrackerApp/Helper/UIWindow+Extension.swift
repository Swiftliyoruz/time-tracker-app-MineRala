//
//  UIWindow+Extension.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 30.09.2022.
//

import UIKit

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
