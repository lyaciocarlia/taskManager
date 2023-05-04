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
    
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(name: String, description: String) {
        let attributedString = NSMutableAttributedString(string: name)
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributedString.length))
        
        taskNameLabel.attributedText = attributedString
        taskDescriptionLabel.text = description
    }
    
}
