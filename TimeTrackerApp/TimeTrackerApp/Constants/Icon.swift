//
//  Icon.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 18.09.2022.
//

import UIKit

struct Icon {
    static var rightArrowIcon: UIImage { UITraitCollection.current.userInterfaceStyle == .light ? UIImage(named: "right arrow")! : UIImage(named: "right arrow dark")! }
    static var timeOutlineIcon: UIImage { UITraitCollection.current.userInterfaceStyle == .light ? UIImage(named: "time-outline")! : UIImage(named: "time-outline-dark")! }
    static var addIcon: UIImage { UITraitCollection.current.userInterfaceStyle == .light ? UIImage(named: " add")! : UIImage(named: "add-dark")! }
    static var pieChartIcon: UIImage { UITraitCollection.current.userInterfaceStyle == .light ? UIImage(named: "pie-chart")! : UIImage(named: "pie-chart-dark")! }
    static var timeOutlineIconSelected: UIImage { UITraitCollection.current.userInterfaceStyle == .light ? UIImage(named: "time-selected")! : UIImage(named: "time-outline-selected-dark")! }
    static var addIconSelected: UIImage { UITraitCollection.current.userInterfaceStyle == .light ? UIImage(named: " add-selected")! : UIImage(named: "add-selected-dark")! }
    static var pieChartIconSelected: UIImage { UITraitCollection.current.userInterfaceStyle == .light ? UIImage(named: "pie-chart-selected")! : UIImage(named: "pie-chart-selected-dark")! }

}
