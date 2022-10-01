//
//  AddViewController.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 12.09.2022.
//

import UIKit

private enum AddViewConstant {
    static let navigationBarTitle = "Add Task"
    static let tabBarTitle = ""
    static let borderWidth = 0.8
    static let borderColor = DefaultColor.borderColor
}

private enum MainCategory {
    case work
    case personal
    
    var title: String {
        switch self {
        case .work:
            return "Work"
        case .personal:
            return "Personal"
        }
    }
}

private enum TaskIcon {
    case monitor
    case code
    case book
    case sport
    
    var title: String {
        switch self {
        case .monitor:
            return "Montior"
        case .code:
            return "Code"
        case .book:
            return "Book"
        case .sport:
            return "Sport"
        }
    }

    var image: UIImage? {
        switch self {
        case .monitor:
            return UIImage(named: "Icon Monitor Circle")
        case .code:
            return UIImage(named: "Icon Code Circle")
        case .book:
            return UIImage(named: "Icon Book Circle")
        case .sport:
            return UIImage(named: "Icon Barbell Circle")
        }
    }
}

final class AddViewController: UIViewController, UINavigationBarDelegate {
    @IBOutlet private weak var taskTitleLabel: UILabel!
    @IBOutlet private weak var taskTitleTextField: UITextField!
    @IBOutlet private weak var mainCategoryLabel: UILabel!
    @IBOutlet private weak var mainCategoryButton: UIButton!
    @IBOutlet private weak var subCategoryTextField: UITextField!
    @IBOutlet private weak var subCategoryLabel: UILabel!
    @IBOutlet private weak var taskIconLabel: UILabel!
    @IBOutlet private weak var taskIconButton: UIButton!
    @IBOutlet private weak var addButton: UIButton!
    
    var textAttributesColor = DefaultColor.black

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpNavigationController() {
        title = AddViewConstant.navigationBarTitle
        tabBarController?.tabBar.items?[safe: 1]?.title = AddViewConstant.tabBarTitle
        let textAttributes = [NSAttributedString.Key.foregroundColor: textAttributesColor]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func setUpMainCategory() {
        let mainCategoryClosure = {(action : UIAction ) in
            print(action.title)
        }
        
        mainCategoryButton.menu = UIMenu(children: [
            UIAction(title: MainCategory.personal.title, handler: mainCategoryClosure),
            UIAction(title: MainCategory.work.title, handler: mainCategoryClosure)
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
            UIAction(title: TaskIcon.book.title, image: TaskIcon.book.image, handler: taskCategoryClosure),
            UIAction(title: TaskIcon.monitor.title, image: TaskIcon.monitor.image, handler: taskCategoryClosure),
            UIAction(title: TaskIcon.code.title, image: TaskIcon.code.image, handler: taskCategoryClosure),
            UIAction(title: TaskIcon.sport.title, image: TaskIcon.sport.image, handler: taskCategoryClosure),
        ])
        
        taskIconButton.showsMenuAsPrimaryAction = true
        taskIconButton.changesSelectionAsPrimaryAction = true
    }
    
    private func setUpButtonBorder() {
        [addButton, mainCategoryButton, taskIconButton].forEach { button in
            guard let button = button else { return }
            button.layer.cornerRadius = CornerRadius.medium.rawValue
            button.layer.borderWidth = AddViewConstant.borderWidth
            button.layer.borderColor = AddViewConstant.borderColor.cgColor
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
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        view.backgroundColor = Color.viewControllerBackgroundColor
        taskTitleLabel.textColor = Color.cellTitleTextColor
        taskTitleTextField.textColor = Color.cellTitleTextColor
        taskTitleTextField.backgroundColor = Color.cellBackgroundColor
        mainCategoryLabel.textColor = Color.cellTitleTextColor
        mainCategoryButton.backgroundColor = Color.cellBackgroundColor
        subCategoryLabel.textColor = Color.cellTitleTextColor
        subCategoryTextField.textColor = Color.cellTitleTextColor
        subCategoryTextField.backgroundColor = Color.cellBackgroundColor
        taskIconLabel.textColor = Color.cellTitleTextColor
        taskIconButton.backgroundColor = Color.cellBackgroundColor
        addButton.titleLabel?.textColor = Color.cellTitleTextColor
        addButton.backgroundColor = Color.cellBackgroundColor
        addButton.layer.borderColor = Color.borderColor.cgColor
        mainCategoryButton.layer.borderColor = Color.borderColor.cgColor
        taskIconButton.layer.borderColor = Color.borderColor.cgColor
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
    @IBAction private func addButtonTapped(_ sender: Any) {
        let newTask = Task(context: DataAccessLayer.context)
        newTask.title = taskTitleTextField.text
        newTask.mainCategory = mainCategoryButton.currentTitle
        newTask.subCategory = subCategoryTextField.text
        newTask.icon = taskIconButton.currentImage?.pngData() != nil ? taskIconButton.currentImage?.pngData() : TaskIcon.book.image?.pngData()
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
