//
//  UIFont+Extension.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 30.09.2022.
//

import UIKit

extension UIFont {
    public static func setFont(type: String, size: CGFloat) -> UIFont {
        return UIFont(name: type, size: size)!
    }
}
