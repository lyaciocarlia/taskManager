//
//  MainScreenViewController.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 01.05.2023.
//

import UIKit

class TaskListViewController: UIViewController {
    @IBOutlet weak var taskListTableView: UITableView!
    var presenter: TaskListPresenter!
}

// MARK: VIEWCONTROLLER LIFE - CYCLE
extension TaskListViewController {
    override func viewDidLoad() {
            super.viewDidLoad()
        taskListTableView.backgroundColor = .white
        taskListTableView.register(UINib(nibName: String(describing: TaskListTableViewCell.self), bundle: nil), forCellReuseIdentifier: TaskListTableViewCell.identifier)
        taskListTableView.register(UINib(nibName: String(describing: CompletedTaskListTableViewCell.self), bundle: nil), forCellReuseIdentifier: CompletedTaskListTableViewCell.identifier)
        taskListTableView.dataSource = self
        taskListTableView.delegate = self
        }
}

// MARK: TABLE VEIW FUNCTIONS
extension TaskListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
                return 2
            }
        
    }
    var headerTitle: [String] {
        return ["Active", "Completed"]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let sectionHeaderLabelView = UIView()

        let sectionHeaderLabel = UILabel()
        sectionHeaderLabel.text = headerTitle[section]
        sectionHeaderLabel.textColor = .black
        sectionHeaderLabel.font = UIFont.boldSystemFont(ofSize: 24)
        sectionHeaderLabelView.addSubview(sectionHeaderLabel)
        sectionHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let sectionHeaderLabelConstraints = [
            sectionHeaderLabel.centerYAnchor.constraint(equalTo: sectionHeaderLabelView.centerYAnchor),
            sectionHeaderLabel.leftAnchor.constraint(equalTo: sectionHeaderLabelView.leftAnchor, constant: 10),
            sectionHeaderLabel.heightAnchor.constraint(equalToConstant: 35),
            sectionHeaderLabel.widthAnchor.constraint(equalToConstant: 250)
        ]
        NSLayoutConstraint.activate(sectionHeaderLabelConstraints)

        return sectionHeaderLabelView

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskListTableViewCell.self)) as? TaskListTableViewCell else {return UITableViewCell()}
            let task = presenter?.getTask(at: indexPath.row, section: indexPath.section)
            print(indexPath.row)
            cell.configure(with: task ?? Task(id: "", name: "", description: "", isCompleted: false))
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CompletedTaskListTableViewCell.self)) as? CompletedTaskListTableViewCell else {return UITableViewCell()}
            print(indexPath.row)

            let task = presenter?.getTask(at: indexPath.row, section: indexPath.section)
            cell.configure(with: task ?? Task(id: "", name: "", description: "", isCompleted: false))
            return cell
            }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

}
 