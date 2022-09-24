//
//  MainTabBarViewController.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 23.09.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    @IBOutlet weak var mainTabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        let myTabBarItem1 = (self.mainTabBar.items?[0])! as UITabBarItem
//        myTabBarItem1.image = Icon.timeOutlineIcon
//        myTabBarItem1.selectedImage = Icon.addIcon
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
