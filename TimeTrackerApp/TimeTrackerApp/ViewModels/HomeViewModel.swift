//
//  HomeViewModel.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 2.10.2022.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    // Actionlar delegate üzerinden yapılacak.
    func setUpNavigationController()
    func setUpUI()
    func traitCollectionDidChange()
    func reloadData()
    func handleDelete(indexPath: IndexPath)
}

protocol HomeViewModelInterface {
    var delegate: HomeViewModelDelegate? { get set }
    var numberOfRowsInSection: Int { get }
    var heightForRowAt: Double { get }
    var taskList: [Task] { get set }
    func viewDidLoad()
    func viewDidAppear()
    
}

private extension HomeViewModel {
    enum Constant {
        static let cellHeight: Double = 100.0
    }
}

final class HomeViewModel {
    weak var delegate: HomeViewModelDelegate?
    
}

//MARK: -
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
    
    func viewDidLoad() {
        print("View Did Load")
        delegate?.setUpNavigationController()
        delegate?.setUpUI()
    }
    
    func viewDidAppear() {
        print("View Did Appear")
        delegate?.reloadData()
    }
}
