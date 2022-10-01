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
    static let borderWidth = 0.8
    static let borderColor = DefaultColor.borderColor
}

enum MainCategories {
    static let work = "Work"
    static let personal = "Personal"
}

enum TaskIcons {
    enum TaskIconTitles {
        static let monitor = "Monitor"
        static let code = "Code"
        static let book = "Book"
        static let sport = "Sport"
    }
    enum TaskIconImages {
        static let monitor = "Icon Monitor Circle"
        static let code = "Icon Code Circle"
        static let book = "Icon Book Circle"
        static let sport = "Icon Barbell Circle"
    }
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
    
    var textAttributesColor = DefaultColor.black

}

//MARK: - Lifecycle
extension AddViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
}

//MARK: - Set Up UI
extension AddViewController {
    private func setUpNavigationController() {
        title = AddViewConstant.navigationBarTitle
        tabBarController?.tabBar.items?[1].title = AddViewConstant.tabBarTitle
        let textAttributes = [NSAttributedString.Key.foregroundColor: textAttributesColor]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func setUpMainCategory() {
        let mainCategoryClosure = {(action : UIAction ) in
            print(action.title)
        }
        
        mainCategoryButton.menu = UIMenu(children: [
            UIAction(title: MainCategories.personal, handler: mainCategoryClosure),
            UIAction(title: MainCategories.work, handler: mainCategoryClosure)
        ])
        
        mainCategoryButton.showsMenuAsPrimaryAction = true
        mainCategoryButton.changesSelectionAsPrimaryAction = true
    }
    
    private func setUpTaskIcon() {
        let taskCategoryClosure = { [self] (action: UIAction) in
            print(action.title)
            taskIconButton.setImage(action.image, for: .normal)
        }
        
        taskIconButton.menu = UIMenu(children: [
            UIAction(title: TaskIcons.TaskIconTitles.book, image: UIImage(named: TaskIcons.TaskIconImages.book), handler: taskCategoryClosure),
            UIAction(title: TaskIcons.TaskIconTitles.monitor, image: UIImage(named: TaskIcons.TaskIconImages.monitor), handler: taskCategoryClosure),
            UIAction(title: TaskIcons.TaskIconTitles.code, image: UIImage(named: TaskIcons.TaskIconImages.code), handler: taskCategoryClosure),
            UIAction(title: TaskIcons.TaskIconTitles.sport, image: UIImage(named: TaskIcons.TaskIconImages.sport), handler: taskCategoryClosure),
        ])
        
        taskIconButton.showsMenuAsPrimaryAction = true
        taskIconButton.changesSelectionAsPrimaryAction = true
    }
    
    private func setUpButtonBorder() {
        let buttonList = [addButton, mainCategoryButton, taskIconButton]
        for button in buttonList {
            button!.layer.cornerRadius = CornerRadius.medium.rawValue
            button!.layer.borderWidth = AddViewConstant.borderWidth
            button!.layer.borderColor = AddViewConstant.borderColor.cgColor
        }
    }
    
    private func setUpTextField() {
        taskTitleTextField.returnKeyType = .done
        taskTitleTextField.delegate = self
        subCategoryTextField.returnKeyType = .done
        subCategoryTextField.delegate = self
    
    }
    
    private func setUpUI() {
        addButton.titleLabel?.font = UIFont.setFont(type: Font.regular.rawValue, size: 14)
        setUpNavigationController()
        setUpMainCategory()
        setUpTaskIcon()
        setUpButtonBorder()
        setUpTextField()
    }
}

//MARK: - Trait Collection
extension AddViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.view.backgroundColor = Color.viewControllerBackgroundColor
        self.taskTitleLabel.textColor = Color.cellTitleTextColor
        self.taskTitleTextField.textColor = Color.cellTitleTextColor
        self.taskTitleTextField.backgroundColor = Color.cellBackgroundColor
        self.mainCategoryLabel.textColor = Color.cellTitleTextColor
        self.mainCategoryButton.backgroundColor = Color.cellBackgroundColor
        self.subCategoryLabel.textColor = Color.cellTitleTextColor
        self.subCategoryTextField.textColor = Color.cellTitleTextColor
        self.subCategoryTextField.backgroundColor = Color.cellBackgroundColor
        self.taskIconLabel.textColor = Color.cellTitleTextColor
        self.taskIconButton.backgroundColor = Color.cellBackgroundColor
        self.addButton.titleLabel?.textColor = Color.cellTitleTextColor
        self.addButton.backgroundColor = Color.cellBackgroundColor
        self.addButton.layer.borderColor = Color.borderColor.cgColor
        self.mainCategoryButton.layer.borderColor = Color.borderColor.cgColor
        self.taskIconButton.layer.borderColor = Color.borderColor.cgColor
        
    }
}

//MARK: - UITextField Delegate
extension AddViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let textFieldText = textField.text {
            print("Tapped done, text: \(textFieldText)")
        }
        return true
    }
}

//MARK: - Actions
extension AddViewController {
    @IBAction func addButtonTapped(_ sender: Any) {
        let newTask = Task(context: DataAccessLayer.getContext())
        newTask.title = taskTitleTextField.text
        newTask.mainCategory = mainCategoryButton.currentTitle
        newTask.subCategory = subCategoryTextField.text
        newTask.icon = taskIconButton.currentImage?.pngData() != nil ? taskIconButton.currentImage?.pngData() : UIImage(named: TaskIcons.TaskIconImages.book)?.pngData()
        newTask.time = 15.66
        
        DataAccessLayer.addTask(task: newTask)
    
        taskTitleTextField.text?.removeAll()
        //mainCategoryButton.currentTitle?.removeAll()
        subCategoryTextField.text?.removeAll()
        //taskIconButton.currentImage.removeAll()
        
        showToast(in: view, message: "The task has been successfully added.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.tabBarController?.selectedIndex = 0
        }
    }
}
