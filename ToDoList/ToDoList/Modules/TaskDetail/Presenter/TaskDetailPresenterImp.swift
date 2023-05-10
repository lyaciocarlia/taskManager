//
//  TaskDetailPresenter.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 09.05.2023.
//

import Foundation

class TaskDetailPresenterImp: TaskDetailPresenter {
    
    weak var view: TaskDetailView?
    var taskServiceImp: TaskService
    
    init(view: TaskDetailViewController, taskServiceImp: TaskService) {
        self.view = view
        self.taskServiceImp = taskServiceImp
    }
    
    func addTask() {
        let task = Task(id: String(Int.random(in: 1...100)), name: view?.taskNameTextField.text ?? " " , description: view?.taskDescriptionTextField.text ?? " " , isCompleted: false)
        taskServiceImp.addTask(task: task)
    }
    
}
