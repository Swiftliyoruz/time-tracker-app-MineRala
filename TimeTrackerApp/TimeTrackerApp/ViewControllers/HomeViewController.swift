//
//  ViewController.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 11.09.2022.
//

import UIKit

enum HomeViewConstant {
    static let tableViewItem = 20
    static let cellHeight: CGFloat = 100.0
    static let cellNibName = "TaskTableViewCell"
    static let cellReuseIdentifier = "TaskTableViewCell"
    static let navigationBarTitle = "Task"
    static let tabBarTitle = ""
}

final class HomeViewController: UIViewController {
    @IBOutlet private weak var taskView: UIView!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var rightArrowButton: UIButton!
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet private weak var todayLabel: UILabel!
    @IBOutlet private weak var taskTableView: UITableView!
    
    var textAttributesColor = DefaultColor.black
    
}

//MARK: - Lifecycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
        setUpUI()
    }
}

//MARK: - Set Up UI
extension HomeViewController {
    private func setUpNavigationController() {
        title = HomeViewConstant.navigationBarTitle
        tabBarController?.tabBar.items?.first?.title = HomeViewConstant.tabBarTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor: textAttributesColor]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func setUpUI() {
        taskView.layer.cornerRadius = CornerRadius.medium.rawValue
        taskTableView.register(UINib(nibName: HomeViewConstant.cellNibName, bundle: nil), forCellReuseIdentifier: HomeViewConstant.cellReuseIdentifier)
        taskTableView.separatorStyle = .none
    }
}

//MARK: - Trait Collection
extension HomeViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.view.backgroundColor = Color.viewControllerBackgroundColor
        self.taskView.backgroundColor = Color.cellBackgroundColor
        self.textAttributesColor = Color.navigationTitleColor
        self.titleLabel.textColor = Color.cellTitleTextColor
        self.timeLabel.textColor = Color.cellTitleTextColor
        self.rightArrowButton.setImage(Icon.rightArrowIcon, for: .normal)
        self.todayLabel.textColor = Color.cellTitleTextColor
        self.seeAllButton.titleLabel?.textColor = Color.cellTitleTextColor
        tabBarController?.tabBar.items?.first?.image = Icon.timeOutlineIcon
        tabBarController?.tabBar.items?.first?.selectedImage = Icon.timeOutlineIconSelected
        
    }
}

//MARK: - TableView Delegate && DataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HomeViewConstant.tableViewItem
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewConstant.cellReuseIdentifier, for: indexPath) as! TaskTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        HomeViewConstant.cellHeight
    }
}
