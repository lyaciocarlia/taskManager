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
    
    var presenter: TaskDetailPresenter!
    var coordinator: MainCoordinator
    var situation: String
    var taskName: String?
    var taskDescription: String?
    var index: Int?
    var section: Int?
    
    init(coordinator: MainCoordinator, situation: String, taskName: String?, taskDescription: String?,index: Int?, section: Int?){
        self.coordinator = coordinator
        self.situation = situation
        self.taskDescription = taskDescription
        self.taskName = taskName
        self.index = index
        self.section = section
        super.init(nibName: String(describing: TaskDetailViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        addTask()
    }
}

// MARK: - VIEW CONTROLLER LIFE - CYCLE

extension TaskDetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if situation == Constants.EditAddTaskSetup.addTask.rawValue{
            saveChangesButton.setTitle("Create Task", for: .normal)
            title = Constants.EditAddTaskSetup.addTask.rawValue
            taskNameTextField.placeholder = "Enter your title..."
            taskDescriptionTextField.placeholder = "Enter an optinal subtitle..."
            saveChangesButton.isHidden = true
        } else {
            saveChangesButton.setTitle("Update Task", for: .normal)
            title = Constants.EditAddTaskSetup.editTask.rawValue
            taskNameTextField.text = taskName
            taskDescriptionTextField.text = taskDescription
            saveChangesButton.isHidden = false
        }
        
        setupTextField(textField: taskDescriptionTextField)
        setupTextField(textField: taskNameTextField)
        
        taskDescriptionTextField.delegate = self
        taskNameTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        firstResponder(textField: taskNameTextField)
    }
}

// MARK: - TEXT FIELD FUNC

extension TaskDetailViewController: UITextFieldDelegate {
    
    private func addTask() {
        taskNameTextField.resignFirstResponder()
        if situation == Constants.EditAddTaskSetup.addTask.rawValue {
            presenter.addTask(name: taskNameTextField.text ?? "", description: taskDescriptionTextField.text ?? "")
        } else {
            presenter.editTask(at: index ?? -1, in: section ?? -1, newName: taskNameTextField.text ?? "", newDescription: taskDescriptionTextField.text ?? "")
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == taskNameTextField {
            presenter.checkForEmptyName(currentText: textField.text ?? "",
                                        range: range,
                                        string: string)
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        taskNameTextField.resignFirstResponder()
        presenter.addTask(name: taskNameTextField.text ?? "", description: taskDescriptionTextField.text ?? "")
        navigationController?.popToRootViewController(animated: true)
        return true
    }
    
    func setupTextField(textField: UITextField) {
        textField.returnKeyType = .done
        textField.textColor = .label
        textField.autocapitalizationType = .sentences
        textField.autocorrectionType = .yes
        textField.becomeFirstResponder()
    }
    
    func firstResponder(textField: UITextField){
        textField.becomeFirstResponder()
    }
}

// MARK: - SAVE CHANGES BUTTON FUNC

extension TaskDetailViewController {
    func updateSaveChangesButtonState(state: Bool) {
        saveChangesButton.isHidden = state
    }
}
