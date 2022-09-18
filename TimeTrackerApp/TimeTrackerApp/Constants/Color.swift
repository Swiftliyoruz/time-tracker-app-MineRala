//
//  Color.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 11.09.2022.
//

import UIKit

struct Color {
    static var viewControllerBackgroundColor: UIColor { UITraitCollection.current.userInterfaceStyle == .light ?  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.03009548783, green: 0.01519311219, blue: 0.09505639225, alpha: 1) }
    static var cellBackgroundColor: UIColor { UITraitCollection.current.userInterfaceStyle == .light ?  #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 1, alpha: 1) : #colorLiteral(red: 0.1633080244, green: 0.1485053897, blue: 0.2292902768, alpha: 1) }
    static var navigationTitleColor: UIColor { UITraitCollection.current.userInterfaceStyle == .light ?  #colorLiteral(red: 0.03009548783, green: 0.01519311219, blue: 0.09505639225, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) }
    static var cellTitleTextColor: UIColor { UITraitCollection.current.userInterfaceStyle == .light ?  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) }
}

struct DefaultColor {
    static let black = UIColor.black
    static let white = UIColor.white
}
