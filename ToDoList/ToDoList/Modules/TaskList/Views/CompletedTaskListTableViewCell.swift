//
//  CompletedTableViewCell.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 04.05.2023.
//

import UIKit

class CompletedTaskListTableViewCell: UITableViewCell {
    
    static let identifier = "CompletedTaskListTableViewCell"
    
    @IBOutlet weak var isCompletedButton: UIButton!
    @IBOutlet private weak var taskDescriptionLabel: UILabel!
    @IBOutlet private weak var taskNameLabel: UILabel!
    
    func configure(with task: Task) {
        
        let attributedString = NSMutableAttributedString(string: task.name)
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(Constants.atributtedStringRange, attributedString.length))
        
        taskNameLabel.attributedText = attributedString
        
        if task.description != "" {
            taskDescriptionLabel.text = task.description
        } else {
            taskDescriptionLabel.isHidden = true
        }
    }
}
