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
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: String(describing: TaskDetailViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        saveChanges()
    }
}

// MARK: - VIEW CONTROLLER LIFE - CYCLE

extension TaskDetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewWasLoaded()
        
        setupTextField(textField: taskDescriptionTextField)
        setupTextField(textField: taskNameTextField)
        
        taskDescriptionTextField.delegate = self
        taskNameTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        taskNameTextField.becomeFirstResponder()
    }
}

// MARK: - TEXT FIELD FUNC

extension TaskDetailViewController: UITextFieldDelegate {
    
    private func saveChanges() {
        taskNameTextField.resignFirstResponder()
        presenter.saveChanges(name: taskNameTextField.text ?? "",
                              description: taskDescriptionTextField.text ?? "")
        navigationController?.popToRootViewController(animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == taskNameTextField {
            presenter.checkForEmptyName(currentText: textField.text ?? "", range: range, string: string)
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        taskNameTextField.resignFirstResponder()
        saveChanges()
        navigationController?.popToRootViewController(animated: true)
        return true
    }
    
}

// MARK: - SAVE CHANGES BUTTON FUNC

extension TaskDetailViewController {
    func updateSaveChangesButtonState(state: Bool) {
        saveChangesButton.isHidden = state
    }
}

// MARK: - SETUP FUNC

extension TaskDetailViewController {
    func setupEditMode(task: Task?) {
        saveChangesButton.setTitle("UpdateTaskButtonTitle".localized(), for: .normal)
        title = EditAddTaskSetup.editTask.rawValue.localized()
        taskNameTextField.text = task?.name
        taskDescriptionTextField.text = task?.description
        saveChangesButton.isHidden = false
    }
    
    func setupAddMode() {
        saveChangesButton.setTitle("CreateTaskButtonTitle".localized(), for: .normal)
        title = EditAddTaskSetup.addTask.rawValue.localized()
        taskNameTextField.placeholder = "TextNameTextFieldPlaceholder".localized()
        taskDescriptionTextField.placeholder = "TextDescTextFieldPlaceholder".localized()
        saveChangesButton.isHidden = true
    }
    
    func setupTextField(textField: UITextField) {
        textField.returnKeyType = .done
        textField.textColor = .label
        textField.autocapitalizationType = .sentences
        textField.autocorrectionType = .yes
        textField.becomeFirstResponder()
    }
}
