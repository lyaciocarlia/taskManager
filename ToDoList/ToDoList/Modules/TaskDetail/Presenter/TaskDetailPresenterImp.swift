//
//  TaskDetailPresenter.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 09.05.2023.
//

import Foundation

class TaskDetailPresenterImp: TaskDetailPresenter {
    
    private unowned let view: TaskDetailView
    private let taskServiceImp: TaskService
    var mode: EditAddTaskSetup
    var task: Task?
    
    init(view: TaskDetailViewController, taskServiceImp: TaskService, mode: EditAddTaskSetup, task: Task?) {
        self.view = view
        self.taskServiceImp = taskServiceImp
        self.mode = mode
        self.task = task
    }
    
    private func addTask(name: String, description: String) {
        let task = Task(id: UUID(),
                        name: name ,
                        description: description ,
                        isCompleted: false,
                        actionDate: Date())
        taskServiceImp.addTask(task: task)
    }
    
    func checkForEmptyName(currentText: String, range: NSRange, string: String) {
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        self.view.updateSaveChangesButtonState(state: newText.isEmpty)
    }
    
    private func editTask(task: Task, newName: String, newDescription: String) {
        taskServiceImp.editTask(task: task, newName: newName, newDescription: newDescription)
    }
    
    func viewWasLoaded() {
        switch mode {
        case .addTask :  view.setupAddMode()
        case .editTask : view.setupEditMode(task: task)
        }
    }
    
    func saveChanges(name: String?, description: String?) {
        switch mode{
        case .addTask: addTask(name: name ?? "", description: description ?? "")
        case .editTask: editTask(task: task!, newName: name ?? "", newDescription: description ?? "")
        }
    }
    
    func viewWasLoaded(mode: EditAddTaskSetup, task: Task?) {
        switch mode {
        case .addTask :  view.setupAddMode()
        case .editTask : view.setupEditMode(task: task)
        }
    }
}
