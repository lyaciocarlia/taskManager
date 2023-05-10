//
//  TaskDetailViewController.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 06.05.2023.
//

import UIKit

class TaskDetailViewController: UIViewController, TaskDetailView {
    
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    @IBAction func saveChanges(_ sender: Any) {
        taskNameTextField.resignFirstResponder()
    }
    var presenter: TaskDetailPresenter!
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator){
        self.coordinator = coordinator
        super.init(nibName: String(describing: TaskDetailViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - VIEW CONTROLLER LIFE - CYCLE
extension TaskDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Task"

        saveChangesButton.isHidden = true
        
        setupTextField(textField: taskDescriptionTextField)
        setupTextField(textField: taskNameTextField)
        
        taskDescriptionTextField.delegate = self
        taskNameTextField.delegate = self
    }
}

// MARK: - TEXT FIELD FUNC

extension TaskDetailViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == taskDescriptionTextField {
            return true
        } else {
            
            let currentText = textField.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            
            if newText.isEmpty {
                saveChangesButton.isHidden = true
            } else {
                saveChangesButton.isHidden = false
            }
            
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupTextField(textField: UITextField) {
        textField.returnKeyType = .done
        textField.autocapitalizationType = .sentences
        textField.autocorrectionType = .yes
        textField.becomeFirstResponder()
    }
}

// MARK: - SAVE CHANGES FUNC

extension TaskDetailViewController {
    func saveChanges() {
        let task = Task(id: String(Int.random(in: 1...100)), name: taskNameTextField.text!, description: taskDescriptionTextField.text!, isCompleted: false)
        //presenter.addTask()
    }
}

