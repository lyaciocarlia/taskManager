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
    
    init(view: TaskDetailViewController, taskServiceImp: TaskService) {
        self.view = view
        self.taskServiceImp = taskServiceImp
    }
    
    func addTask(name: String, description: String) {
        let task = Task(id: UUID().uuidString,
                        name: name ,
                        description: description ,
                        isCompleted: false)
        taskServiceImp.addTask(task: task)
    }
    
    func checkForEmptyName(currentText: String, range: NSRange, string: String) {
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        self.view.updateSaveChangesButtonState(state: newText.isEmpty)
    }
    
    func editTask(at index: Int, in section: Int, newName: String, newDescription: String) {
        taskServiceImp.editTask(at: index, in: section, newName: newName, newDescription: newDescription)
    }
    
    func viewWasLoaded(mode: EditAddTaskSetup, task: Task?) {
        if mode == .addTask {
            view.setupAddMode()
        } else {
            view.setupEditMode(task: task)
        }
    }
    
}
