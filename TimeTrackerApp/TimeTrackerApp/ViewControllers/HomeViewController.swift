//
//  ViewController.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 11.09.2022.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.view.backgroundColor = Color.viewControllerBackgroundColor 
    }
}

