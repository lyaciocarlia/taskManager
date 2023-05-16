//
//  TaskDetailPresenter.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 09.05.2023.
//

import Foundation

protocol TaskDetailPresenter {
    
    func saveChanges(mode: EditAddTaskSetup, name: String?, description: String?, task: Task?)
    func viewWasLoaded(mode: EditAddTaskSetup, task: Task?)
    func addTask(name: String, description: String)
    func checkForEmptyName(currentText: String, range: NSRange, string: String)
    func editTask(task: Task, newName: String, newDescription: String)
    
}
