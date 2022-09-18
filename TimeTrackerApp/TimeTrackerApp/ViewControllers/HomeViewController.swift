//
//  ViewController.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 11.09.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var taskView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rightArrowButton: UIButton!
    
    var textAttributesColor = DefaultColor.black
   
    override func viewDidLoad() {
        super.viewDidLoad()
        taskView.layer.cornerRadius = 8
        title = "Task"
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor: textAttributesColor]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.view.backgroundColor = Color.viewControllerBackgroundColor
        self.taskView.backgroundColor = Color.cellBackgroundColor
        self.textAttributesColor = Color.navigationTitleColor
        self.titleLabel.textColor = Color.cellTitleTextColor
        self.timeLabel.textColor = Color.cellTitleTextColor
        self.rightArrowButton.setImage(Icon.rightArrowIcon, for: .normal)
    }
}

