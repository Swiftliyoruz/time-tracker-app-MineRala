//
//  Icon.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 18.09.2022.
//

import UIKit

struct Icon {
    static var rightArrowIcon: UIImage { UITraitCollection.current.userInterfaceStyle == .light ? UIImage(named: "right arrow")! : UIImage(named: "right arrow dark")! }
}
