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
    
    private var index: IndexPath?
    weak var delegate: CellDelegate?
    
    @IBAction func markAsComplete() {
        guard let index = index else { return }
        delegate?.markTaskAsComplete(at: index)
    }
    
    func configure(with task: Task, index: IndexPath) {
        self.index = index
        
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
