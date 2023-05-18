//
//  TaskListTableViewCell.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 02.05.2023.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {
    
    static let identifier = "TaskListTableViewCell"
    
    @IBOutlet private weak var taskDescriptionLabel: UILabel!
    @IBOutlet private weak var taskNameLabel: UILabel!
    @IBOutlet private weak var isCompletedButton: UIButton!
    
    private var index: IndexPath?
    weak var delegate: CellDelegate?
    
    @IBAction func changeTaskState() {
        guard let index = index else { return }
        delegate?.changeTaskState(at: index)
    }
    
    func configure(with task: Task, index: IndexPath) {
        self.index = index
        taskDescriptionLabel.isHidden = false
        
        taskNameLabel.text = task.name
        
        if task.description != "" {
            taskDescriptionLabel.text = task.description
        } else {
            taskDescriptionLabel.isHidden = true
        }
    }
}
