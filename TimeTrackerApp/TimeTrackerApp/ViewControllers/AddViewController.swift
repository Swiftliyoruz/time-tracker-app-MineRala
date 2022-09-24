//
//  AddViewController.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 12.09.2022.
//

import UIKit

enum AddViewConstant {
    static let navigationBarTitle = "Add Task"
    static let tabBarTitle = ""
}

final class AddViewController: UIViewController, UINavigationBarDelegate {
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var mainCategoryLabel: UILabel!
    @IBOutlet weak var mainCategoryButton: UIButton!
    @IBOutlet weak var subCategoryTextField: UITextField!
    @IBOutlet weak var subCategoryLabel: UILabel!
    @IBOutlet weak var taskIconLabel: UILabel!
    @IBOutlet weak var taskIconButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = AddViewConstant.navigationBarTitle
        tabBarController?.tabBar.items?[1].title = AddViewConstant.tabBarTitle
        setUpUI()
    }
    
    private func setUpUI() {
        var mainCategoryClosure = {(action : UIAction ) in
            //print(action.title)
        }
        
        mainCategoryButton.menu = UIMenu(children: [
            UIAction(title: "ABC", handler: mainCategoryClosure),
            UIAction(title: "llaa", handler: mainCategoryClosure)
        ])
        
        mainCategoryClosure = { [self] (action: UIAction) in
            taskIconButton.setImage(action.image, for: .normal)
            
        }
        
        taskIconButton.menu = UIMenu(children: [
            UIAction(image:  UIImage(named: "Icon Monitor Circle"),handler: mainCategoryClosure),
            UIAction(image:  UIImage(named: "Icon Code Circle"),handler: mainCategoryClosure),
           
        ])
       

        mainCategoryButton.showsMenuAsPrimaryAction = true
        mainCategoryButton.changesSelectionAsPrimaryAction = true
      
                                     taskIconButton.showsMenuAsPrimaryAction = true
                                     taskIconButton.changesSelectionAsPrimaryAction = true
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.view.backgroundColor = Color.viewControllerBackgroundColor
    }
}

//MARK: - Actions
extension AddViewController {
    @IBAction func mainCategoryButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func taskIconButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
    }

}
