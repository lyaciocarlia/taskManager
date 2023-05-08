//
//  MainScreenViewController.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 01.05.2023.
//

import UIKit

class TaskListViewController: UIViewController, TaskListView {
    
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var taskListTableView: UITableView!
    
    @IBOutlet weak var emptyListImage: UIImageView!
    
    var presenter: TaskListPresenter!
    var numberOfSections: Int {
        if presenter.activeTasks.count != Constants.zeroTasks && presenter.completedTasks.count !=  Constants.zeroTasks {
            return Constants.twoSections
        } else {
            return Constants.oneSection
        }
    }
}

// MARK: - SETUP FUNC

extension TaskListViewController {
    private func setupAddTaskButton(){
        addTaskButton.layer.cornerRadius = 32
        addTaskButton.layer.masksToBounds = true
    }
    
    private func setupTaskListTableView(){
        taskListTableView.backgroundColor = .white
        taskListTableView.register(UINib(nibName: String(describing: TaskListTableViewCell.self), bundle: nil), forCellReuseIdentifier: TaskListTableViewCell.identifier)
        taskListTableView.register(UINib(nibName: String(describing: CompletedTaskListTableViewCell.self), bundle: nil), forCellReuseIdentifier: CompletedTaskListTableViewCell.identifier)
        taskListTableView.dataSource = self
        taskListTableView.delegate = self
    }
    
    func headerLabelSetup (label : UILabel, view: UIView) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: Constants.headerLabelFontSize)
        let sectionHeaderLabelConstraints = [
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.headerLabelTopAnchor),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.headerLabelLeftAnchor),
            label.heightAnchor.constraint(equalToConstant: Constants.headerLabelHeightAnchor),
            label.widthAnchor.constraint(equalToConstant: Constants.headerLabelWidthAnchor)
        ]
        NSLayoutConstraint.activate(sectionHeaderLabelConstraints)
    }
}

// MARK: - VIEWCONTROLLER LIFE - CYCLE

extension TaskListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTaskListTableView()
        emptyListImage.isHidden = true
        presenter.checkForEmtpyList()
        setupAddTaskButton()
//        self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
    
    func displayEmptyImage() {
        taskListTableView.isHidden = true
        emptyListImage.isHidden = false
    }
}

// MARK: - TABLE VEIW FUNCTIONS

extension TaskListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getTasksCount(in: section)
    }
    
    var headerTitle: [String] {
        return ["Active", "Completed"]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionHeaderLabelView = UIView()
        
        let sectionHeaderLabel = UILabel()
        if numberOfSections == Constants.twoSections
        {
            sectionHeaderLabel.text = headerTitle[section]
        } else {
            if presenter.activeTasks.count != Constants.zeroTasks {
                sectionHeaderLabel.text = "Active"
            } else {
                sectionHeaderLabel.text = "Completed"
            }
        }
        
        sectionHeaderLabelView.addSubview(sectionHeaderLabel)
        headerLabelSetup(label: sectionHeaderLabel, view: sectionHeaderLabelView)
        
        return sectionHeaderLabelView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == Constants.firstSection && presenter.activeTasks.count != 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskListTableViewCell.self)) as? TaskListTableViewCell else {return UITableViewCell()}
            let task = presenter?.getTask(at: indexPath.row, section: indexPath.section)
            cell.configure(with: task ?? Task(id: "", name: "", description: "", isCompleted: false))
            return cell
        } else {
            if presenter.completedTasks.count != Constants.zeroTasks {
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
