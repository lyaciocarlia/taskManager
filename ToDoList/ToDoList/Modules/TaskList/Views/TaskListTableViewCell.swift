//
//  TaskListTableViewCell.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 02.05.2023.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {
    
    
    @IBOutlet private weak var taskDescriptionLabel: UILabel!
    @IBOutlet private weak var taskNameLabel: UILabel!
    @IBOutlet private weak var isCompletedButton: UIButton!
    static let identifier = "TaskListTableViewCell"
    
    func configure(with task: Task) {
        
        taskNameLabel.text = task.name
      
        if task.description != "" {
            taskDescriptionLabel.text = task.description
        } else {
            taskDescriptionLabel.isHidden = true
        }
    }
}
