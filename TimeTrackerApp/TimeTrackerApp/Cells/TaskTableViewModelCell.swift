//
//  TaskTableViewModelCell.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 9.10.2022.
//

import Foundation

protocol TaskTableViewModelCellInterface {
    var view: TaskTableViewCellInterface? { get set }
    
    func awakeFromNib()
}

final class TaskTableViewModelCell {
    weak var view: TaskTableViewCellInterface?
    
}

extension TaskTableViewModelCell: TaskTableViewModelCellInterface {
    func awakeFromNib() {
        view?.setUpUI()
    }
}
