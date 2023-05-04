//
//  MainScreenViewController.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 01.05.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    @IBOutlet weak var taskListTableView: UITableView!
}

// MARK: VIEWCONTROLLER LIFE - CYCLE
extension MainScreenViewController {
    override func viewDidLoad() {
            super.viewDidLoad()
        taskListTableView.register(UINib(nibName: String(describing: TaskListTableViewCell.self), bundle: nil), forCellReuseIdentifier: TaskListTableViewCell.identifier)
        taskListTableView.register(UINib(nibName: String(describing: CompletedTaskListTableViewCell.self), bundle: nil), forCellReuseIdentifier: CompletedTaskListTableViewCell.identifier)
        taskListTableView.dataSource = self
        taskListTableView.delegate = self
        }
}

// MARK: TABLE VEIW FUNCTIONS
extension MainScreenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        } else {
                return 5
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
        sectionHeaderLabel.font = UIFont.boldSystemFont(ofSize: 25)
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
            cell.configure(name: "Name", description: "Description")
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CompletedTaskListTableViewCell.self)) as? CompletedTaskListTableViewCell else {return UITableViewCell()}
            cell.configure(name: "Name", description: "Description")
            return cell
            }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

}
 
