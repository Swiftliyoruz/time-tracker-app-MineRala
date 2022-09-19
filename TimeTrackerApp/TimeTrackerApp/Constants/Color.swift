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
    static var cellTagViewColor: UIColor { UITraitCollection.current.userInterfaceStyle == .light ?  #colorLiteral(red: 0.999234736, green: 0.9350280166, blue: 0.9448389411, alpha: 1) : #colorLiteral(red: 0.2566387653, green: 0.1646820605, blue: 0.2479508519, alpha: 1) }
    static var cellTagViewTwoColor: UIColor { UITraitCollection.current.userInterfaceStyle == .light ?  #colorLiteral(red: 1, green: 0.9227246642, blue: 0.9328266978, alpha: 1) : #colorLiteral(red: 0.2116626799, green: 0.1628367305, blue: 0.2947718501, alpha: 1) }
    static var cellTagViewLabelTextColor: UIColor { UITraitCollection.current.userInterfaceStyle == .light ?  #colorLiteral(red: 1, green: 0.2752893865, blue: 0.4094802737, alpha: 1) : #colorLiteral(red: 1, green: 0.2892884612, blue: 0.4244042635, alpha: 1) }
    static var cellTagViewTwoLabelTextColor: UIColor { UITraitCollection.current.userInterfaceStyle == .light ?  #colorLiteral(red: 0.6522679329, green: 0.297410816, blue: 0.9091938138, alpha: 1) : #colorLiteral(red: 0.6522679329, green: 0.297410816, blue: 0.9091938138, alpha: 1) }
}

struct DefaultColor {
    static let black = UIColor.black
    static let white = UIColor.white
}
