//
//  TaskListTableViewCell.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 02.05.2023.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var isCompletedButton: UIButton!
    static let identifier = "TaskListTableViewCell"

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(name: String, description: String) {
            taskNameLabel.text = name
            taskDescriptionLabel.text = description
        }
    
}
