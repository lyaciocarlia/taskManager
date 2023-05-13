//
//  MainScreenViewController.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 01.05.2023.
//

import UIKit

class TaskListViewController: UIViewController, TaskListView {
    
    @IBOutlet private weak var addTaskButton: UIButton!
    @IBOutlet private weak var taskListTableView: UITableView!
    @IBOutlet private weak var emptyListImage: UIImageView!
    
    var presenter: TaskListPresenter!
    var coordinator: MainCoordinator
    let headerTitle = ["Active", "Completed"]
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: String(describing: TaskListViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func openDetailScreen (_ sender: UIButton) {
        let vc = coordinator.setupTaskDetailVC(mode: .addTask, task: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - SETUP FUNC

extension TaskListViewController {
    private func setupAddTaskButton() {
        addTaskButton.layer.cornerRadius = Constants.addTaskButtonCornerRadius
        addTaskButton.layer.masksToBounds = true
    }
    
    private func navBarButtonSetup() -> UIBarButtonItem {
        let buttonSize = Constants.navBarButtonSize 
        let customView = UIView(frame: CGRect(origin: .zero, size: buttonSize))
        let button = UIButton(type: .system)
        button.frame = customView.bounds
        if taskListTableView.isEditing {
            button.setTitle("Done", for: .normal)
        } else {
            button.setTitle("Edit", for: .normal)
        }
        button.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        button.addTarget(self, action: #selector(editTaskList), for: .touchUpInside)
        customView.addSubview(button)
        let barButtonItem = UIBarButtonItem(customView: customView)
        return barButtonItem
    }
    
    private func setupTaskListTableView() {
        
        taskListTableView.contentInsetAdjustmentBehavior = .never
        taskListTableView.register(UINib(nibName: String(describing: TaskListTableViewCell.self), bundle: nil),
                                   forCellReuseIdentifier: TaskListTableViewCell.identifier)
        taskListTableView.register(UINib(nibName: String(describing: CompletedTaskListTableViewCell.self), bundle: nil),
                                   forCellReuseIdentifier: CompletedTaskListTableViewCell.identifier)
        taskListTableView.dataSource = self
        taskListTableView.delegate = self
        
    }
    
    @objc func editTaskList(){
        taskListTableView.isEditing = !taskListTableView.isEditing
        let barButtonItem = navBarButtonSetup()
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    private func headerLabelSetup (label: UILabel, view: UIView) {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: Constants.headerLabelFontSize)
        let sectionHeaderLabelConstraints = [
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.headerLabelTopAnchor),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.headerLabelLeftAnchor),
            label.heightAnchor.constraint(equalToConstant: Constants.headerLabelHeightAnchor),
            label.widthAnchor.constraint(equalToConstant: Constants.headerLabelWidthAnchor)
        ]
        NSLayoutConstraint.activate(sectionHeaderLabelConstraints)
        
    }
    
    func updateEmptyListImage(isHidden: Bool) {
        taskListTableView.isHidden = isHidden
        emptyListImage.isHidden = !isHidden
    }
}

// MARK: - VIEWCONTROLLER LIFE - CYCLE

extension TaskListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTaskListTableView()
        emptyListImage.isHidden = true
        setupAddTaskButton()
        title = "TaskManager"
        let barButtonItem = navBarButtonSetup()
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        taskListTableView.reloadData()
        presenter.viewWillAppear()
    }
}

// MARK: - TABLE VEIW FUNCTIONS

extension TaskListViewController: UITableViewDataSource, UITableViewDelegate, CellDelegate {
    func markTaskAsComplete() {
        
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "") { (action, view, completionHandler) in
            self.markTaskAsComplete()
        }
        
        action.backgroundColor = Constants.markAsCompleteColor
        action.image = UIImage(named: "doneSymbol")
        
        let configuration = UISwipeActionsConfiguration(actions: [action])
        return configuration
    }
    
    func getNrOfSections() -> Int {
        if presenter.activeTasksCount() != Constants.zeroTasks && presenter.completedTasksCount() !=  Constants.zeroTasks {
            return Constants.twoSections
        } else {
            return Constants.oneSection
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getTasksCount(in: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionHeaderLabelView = UIView()
        
        let sectionHeaderLabel = UILabel()
        if getNrOfSections() == Constants.twoSections {
            sectionHeaderLabel.text = headerTitle[section]
        } else {
            if presenter.activeTasksCount() != Constants.zeroTasks {
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
        
        if indexPath.section == Constants.firstSection && presenter.activeTasksCount() != 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskListTableViewCell.self)) as? TaskListTableViewCell else {return UITableViewCell()}
            let task = presenter?.getTask(at: indexPath.row, section: indexPath.section)
            cell.selectionStyle = .none
            cell.configure(with: task ?? Task(id: "", name: "", description: "", isCompleted: false))
            return cell
        } else {
            if presenter.completedTasksCount() != Constants.zeroTasks {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CompletedTaskListTableViewCell.self)) as? CompletedTaskListTableViewCell else {return UITableViewCell()}
                cell.selectionStyle = .none
                let task = presenter?.getTask(at: indexPath.row, section: indexPath.section)
                cell.configure(with: task ?? Task(id: "", name: "", description: "", isCompleted: false))
                return cell
            }
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        presenter.moveTask(from: sourceIndexPath, to: destinationIndexPath)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        
        let sourceSection = sourceIndexPath.section
        let destSection = proposedDestinationIndexPath.section
        
        if destSection < sourceSection {
            return IndexPath(row: 0, section: sourceSection)
        } else if destSection > sourceSection {
            return IndexPath(row: self.tableView(tableView, numberOfRowsInSection:sourceSection)-1, section: sourceSection)
        }
        
        return proposedDestinationIndexPath
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return getNrOfSections()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "") { (action, view, completionHandler) in
            
            let alertController = UIAlertController(title: "Confirmation", message: "Are you sure you want to proceed?", preferredStyle: .alert)
            
            let yesAction = UIAlertAction(title: "Yes", style: .default) { (_) in
                self.presenter.deleteTask(at: indexPath.row, in: indexPath.section)
                completionHandler(true)
                self.taskListTableView.reloadData()
                
            }
            
            let noAction = UIAlertAction(title: "No", style: .cancel) { (_) in
            }
            
            alertController.addAction(yesAction)
            alertController.addAction(noAction)
            
            self.present(alertController, animated: true, completion: nil)
            
            
        }
        
        let editAction = UIContextualAction(style: .normal, title: "") { (action, view, completionHandler) in
            self.navigationController?.pushViewController(
                self.coordinator.setupTaskDetailVC(mode: .editTask,
                                                   task: self.presenter.getTask(at: indexPath.row, section: indexPath.section)),
                animated: true)
        }
        
        editAction.backgroundColor = Constants.editButtonColor
        editAction.image = UIImage(systemName: "pencil")
        deleteAction.backgroundColor = Constants.deleteButtonColor
        deleteAction.image = UIImage(named: "deleteButton")
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        return configuration
    }
    
}
