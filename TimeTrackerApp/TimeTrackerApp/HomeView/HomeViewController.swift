//
//  ViewController.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 11.09.2022.
//

import UIKit

private enum HomeViewConstant {
    static let cellNibName = "TaskTableViewCell"
    static let cellReuseIdentifier = "TaskTableViewCell"
    static let navigationBarTitle = "Task"
    static let tabBarTitle = ""
    static let titleTextAttributes = DefaultColor.black
}

protocol HomeViewModelDelegate: AnyObject, AlertPresentable {
    func setUpNavigationController()
    func setUpUI()
    func reloadData()
    func handleDelete(indexPath: IndexPath)
    func deleteRows(indexPath: IndexPath)
}

final class HomeViewController: UIViewController {
    @IBOutlet private weak var taskView: UIView!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var rightArrowButton: UIButton!
    @IBOutlet private weak var seeAllButton: UIButton!
    @IBOutlet private weak var todayLabel: UILabel!
    @IBOutlet private weak var taskTableView: UITableView!
    
    private lazy var viewModel: HomeViewModelInterface = HomeViewModel()
        //{ didSet { viewModel.delegate = self } }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        view.backgroundColor = Color.viewControllerBackgroundColor
        taskView.backgroundColor = Color.cellBackgroundColor
        titleLabel.textColor = Color.cellTitleTextColor
        timeLabel.textColor = Color.cellTitleTextColor
        rightArrowButton.setImage(Icon.rightArrowIcon, for: .normal)
        todayLabel.textColor = Color.cellTitleTextColor
        seeAllButton.titleLabel?.textColor = Color.cellTitleTextColor
        tabBarController?.tabBar.items?.first?.image = Icon.timeOutlineIcon
        tabBarController?.tabBar.items?.first?.selectedImage = Icon.timeOutlineIconSelected
    }
}

//MARK: - TableView DataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewConstant.cellReuseIdentifier, for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configureCell(task: viewModel.taskList[indexPath.row])
        return cell
    }
}

//MARK: - TableView Delegate
extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.heightForRowAt
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: NSLocalizedString("Delete", comment: "")) { [weak self] (action, view, completionHandler) in
            guard let self = self else {
                completionHandler(false)
                return
            }
            self.viewModel.handleDeletion(indexPath: indexPath)
            completionHandler(true)
        }
        delete.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        let configuration = UISwipeActionsConfiguration(actions: [delete])
        return configuration
    }
}

//MARK: - HomeViewModelDelegate
extension HomeViewController: HomeViewModelDelegate {
func setUpNavigationController() {
        title = HomeViewConstant.navigationBarTitle
        tabBarController?.tabBar.items?.first?.title = HomeViewConstant.tabBarTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: HomeViewConstant.titleTextAttributes]
    }
    
     func setUpUI() {
        taskView.layer.cornerRadius = CornerRadius.medium.rawValue
        taskTableView.register(UINib(nibName: HomeViewConstant.cellNibName, bundle: nil), forCellReuseIdentifier: HomeViewConstant.cellReuseIdentifier)
        taskTableView.separatorStyle = .none
    }
    
    func reloadData() {
        taskTableView.reloadData()
    }
    
    func handleDelete(indexPath: IndexPath) {
        viewModel.handleDeletion(indexPath: indexPath)
    }
    
    func deleteRows(indexPath: IndexPath) {
        taskTableView.deleteRows(at: [indexPath], with: .fade)
    }
}
