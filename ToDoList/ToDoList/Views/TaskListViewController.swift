//
//  MainScreenViewController.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 01.05.2023.
//

import UIKit

class TaskListViewController: UIViewController {
    
    @IBOutlet weak var taskListTableView: UITableView!
    
    @IBOutlet weak var emptyListImage: UIImageView!
    
    var presenter: TaskListPresenter!
    var numberOfSections: Int {
        if presenter.activeTasks.count != 0 && presenter.completedTasks.count != 0 {
            return Constants.twoSections
        } else {
            return Constants.oneSection
        }
    }
}

// MARK: - VIEWCONTROLLER LIFE - CYCLE

extension TaskListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTaskListTableView()
        emptyListImage.isHidden = true
        presenter.checkForEmtpyList()
    }
    
    func displayEmptyImage() {
        taskListTableView.isHidden = true
        emptyListImage.isHidden = false
    }
}

// MARK: - TABLE VEIW FUNCTIONS

extension TaskListViewController: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTaskListTableView(){
        taskListTableView.backgroundColor = .white
        taskListTableView.register(UINib(nibName: String(describing: TaskListTableViewCell.self), bundle: nil), forCellReuseIdentifier: TaskListTableViewCell.identifier)
        taskListTableView.register(UINib(nibName: String(describing: CompletedTaskListTableViewCell.self), bundle: nil), forCellReuseIdentifier: CompletedTaskListTableViewCell.identifier)
        taskListTableView.dataSource = self
        taskListTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getTasksCount(in: section)
    }
    
    var headerTitle: [String] {
        return ["Active", "Completed"]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionHeaderLabelView = UIView()
        
        let sectionHeaderLabel = UILabel()
        if numberOfSections == 2
        {
            sectionHeaderLabel.text = headerTitle[section]
        } else {
            if presenter.activeTasks.count != 0 {
                sectionHeaderLabel.text = "Active"
            } else {
                sectionHeaderLabel.text = "Completed"
            }
        }
        sectionHeaderLabel.textColor = .black
        sectionHeaderLabel.font = UIFont.boldSystemFont(ofSize: Constants.headerLabelFontSize)
        sectionHeaderLabelView.addSubview(sectionHeaderLabel)
        sectionHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let sectionHeaderLabelConstraints = [
            sectionHeaderLabel.topAnchor.constraint(equalTo: sectionHeaderLabelView.topAnchor, constant: 24),
            sectionHeaderLabel.leftAnchor.constraint(equalTo: sectionHeaderLabelView.leftAnchor, constant: Constants.headerLabelLeftAnchor),
            sectionHeaderLabel.heightAnchor.constraint(equalToConstant: Constants.headerLabelHeightAnchor),
            sectionHeaderLabel.widthAnchor.constraint(equalToConstant: Constants.headerLabelWidthAnchor)
        ]
        NSLayoutConstraint.activate(sectionHeaderLabelConstraints)
        
        return sectionHeaderLabelView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == Constants.firstSection && presenter.activeTasks.count != 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskListTableViewCell.self)) as? TaskListTableViewCell else {return UITableViewCell()}
            let task = presenter?.getTask(at: indexPath.row, section: indexPath.section)
            cell.configure(with: task ?? Task(id: "", name: "", description: "", isCompleted: false))
            return cell
        } else {
            if presenter.completedTasks.count != 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CompletedTaskListTableViewCell.self)) as? CompletedTaskListTableViewCell else {return UITableViewCell()}
                let task = presenter?.getTask(at: indexPath.row, section: indexPath.section)
                cell.configure(with: task ?? Task(id: "", name: "", description: "", isCompleted: false))
                return cell
            }
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
}
