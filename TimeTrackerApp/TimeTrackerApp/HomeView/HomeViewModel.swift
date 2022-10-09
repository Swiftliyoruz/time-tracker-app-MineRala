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
    var textAttributesColor: String { get set }
    func viewDidLoad()
    func viewDidAppear()
    func handleDeletion(indexPath: IndexPath)
    func deleteItem(indexPath: IndexPath)
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
        set {}
    }
    
    var numberOfRowsInSection: Int {
        taskList.count
    }
    
    var heightForRowAt: Double {
        Constant.cellHeight
    }
    
    var textAttributesColor: String {
        get {
            return "000000"
        }
        set { }
    }
    
    func viewDidLoad() {
        print("View Did Load")
        delegate?.setUpNavigationController()
        delegate?.setUpUI()
    }
    
    func viewDidAppear() {
        print("View Did Appear")
        delegate?.reloadData()
    }
    
    func handleDeletion(indexPath: IndexPath) {
        delegate?.handleDelete(indexPath: indexPath)
    }
    
    func deleteItem(indexPath: IndexPath) {
        DataAccessLayer.deleteTask(task: taskList[indexPath.row])
        guard let taskList = DataAccessLayer.fetchTasks() else { return }
        self.taskList = taskList
        delegate?.deleteRows(indexPath: indexPath)
        delegate?.reloadData()
    }
    
}
