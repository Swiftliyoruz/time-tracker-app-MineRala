//
//  AddViewModel.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 8.10.2022.
//

import Foundation

protocol AddViewModelInterface {
    var view: AddViewInterface? { get set }

    func viewDidLoad()
    func addItem(newTask: Task)
}

final class AddViewModel {
    weak var view: AddViewInterface?
   
}

extension AddViewModel: AddViewModelInterface {
    var textAttributesColor: String {
        "000000"
    }
    
    func viewDidLoad() {
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
