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
}
