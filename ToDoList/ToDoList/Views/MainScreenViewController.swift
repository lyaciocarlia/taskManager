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
        taskListTableView.dataSource = self
        taskListTableView.delegate = self
        }
}

// MARK: TABLE VEIW FUNCTIONS
extension MainScreenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 6
        } else {
                return 6
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
        sectionHeaderLabel.frame = CGRect(x: 24, y: -15, width: 250, height: 35)
        sectionHeaderLabelView.addSubview(sectionHeaderLabel)

        return sectionHeaderLabelView

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskListTableViewCell.self)) as? TaskListTableViewCell else {return UITableViewCell()}
        cell.configure(name: "name", description: "description")
//        //cell.taskDescriptionLabel.text = "Maria"
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

}
 
