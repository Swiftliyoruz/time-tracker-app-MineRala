//
//  AddViewModel.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 8.10.2022.
//

import Foundation

protocol AddViewInterface: AnyObject {
    func setUpNavigationController()
    func setUpMainCategory()
    func setUpTaskIcon()
    func setUpButtonBorder()
    func setUpTextField()
    func traitCollectionDidChange()
}

protocol AddViewModelInterface {
    var view: AddViewInterface? { get set }
    var textAttributesColor: String { get }
    func viewDidLoad()
    func setUpUI()
    func addItem(newTask: Task)
}

final class AddViewModel {
    weak var view: AddViewInterface?
   
}

extension AddViewModel: AddViewModelInterface {
    var textAttributesColor: String {
        get {
            return "000000"
        }
    }
    

    func viewDidLoad() {
        setUpUI()
    }
    
    func setUpUI() {
        view?.setUpNavigationController()
        view?.setUpMainCategory()
        view?.setUpTaskIcon()
        view?.setUpButtonBorder()
        view?.setUpTextField()
    }
    
    func addItem(newTask: Task) {
        DataAccessLayer.addTask(task: newTask)
    }

}
