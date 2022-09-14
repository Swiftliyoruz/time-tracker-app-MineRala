//
//  TimerViewController.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 12.09.2022.
//

import UIKit

class TimerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.view.backgroundColor = Color.viewControllerBackgroundColor
    }
}
