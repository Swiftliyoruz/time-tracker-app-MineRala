//
//  HomeViewModel.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 2.10.2022.
//

import Foundation

protocol HomeViewModelInterface {
    var delegate: HomeViewModelDelegate? { get set }
    var numberOfRowsInSection: Int { get }
    var heightForRowAt: Double { get }
    var taskList: [Task] { get set }
    
    func viewDidLoad()
    func viewDidAppear()
    func handleDeletion(indexPath: IndexPath)
}

private extension HomeViewModel {
    enum Constant {
        static let cellHeight: Double = 100.0
    }
}

final class HomeViewModel {
    weak var delegate: HomeViewModelDelegate?
    
}

//MARK: - HomeViewModelInterface
extension HomeViewModel: HomeViewModelInterface {

    var taskList: [Task] {
        get {
            DataAccessLayer.fetchTasks() ?? []
        }
        set {
            
        }
    }
    
    var numberOfRowsInSection: Int {
        taskList.count
    }
    
    var heightForRowAt: Double {
        Constant.cellHeight
    }

    func viewDidLoad() {
        delegate?.setUpNavigationController()
        delegate?.setUpUI()
    }
    
    func viewDidAppear() {
        delegate?.reloadData()
    }
    
    func handleDeletion(indexPath: IndexPath) {
        delegate?.showAlert(message: "Are you sure you want to delete this task from  list?", indexPath: indexPath, deletion: {
            DataAccessLayer.deleteTask(task: self.taskList[indexPath.row])
            guard let taskList = DataAccessLayer.fetchTasks() else { return }
            self.taskList = taskList
            self.delegate?.deleteRows(indexPath: indexPath)
            self.delegate?.reloadData()
        })
    }
}
