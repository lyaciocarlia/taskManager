//
//  TaskDetailViewController.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 06.05.2023.
//

import UIKit

class TaskDetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var saveChangesButton: UIButton!
    
}

// MARK: - VIEW CONTROLLER LIFE - CYCLE
extension TaskDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDescriptionTextField.delegate = self
        taskNameTextField.delegate = self
    }
}
