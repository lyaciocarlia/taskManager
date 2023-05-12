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
    public enum EditAddTaskSetup {
        case addTask(String)
        case editTask(String)
    }
    
    init(coordinator: MainCoordinator){
        self.coordinator = coordinator
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
        title = "Add Task"
        
        saveChangesButton.isHidden = true
        
        setupTextField(textField: taskDescriptionTextField)
        setupTextField(textField: taskNameTextField)
        
        taskDescriptionTextField.delegate = self
        taskNameTextField.delegate = self
    }
}

// MARK: - TEXT FIELD FUNC

extension TaskDetailViewController: UITextFieldDelegate {
    
    private func addTask() {
        taskNameTextField.resignFirstResponder()
        presenter.addTask(name: taskNameTextField.text ?? "", description: taskDescriptionTextField.text ?? "")
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
        textField.autocapitalizationType = .sentences
        textField.autocorrectionType = .yes
        textField.becomeFirstResponder()
    }
}

// MARK: - SAVE CHANGES BUTTON FUNC

extension TaskDetailViewController {
    func updateSaveChangesButtonState(state: Bool) {
        saveChangesButton.isHidden = state
    }
}
