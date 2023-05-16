//
//  TaskDetailPresenter.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 09.05.2023.
//

import Foundation

protocol TaskDetailPresenter {
    
    var mode: EditAddTaskSetup { get set }
    var task: Task? { get set }
    func saveChanges(name: String?, description: String?)
    func viewWasLoaded()
    func addTask(name: String, description: String)
    func checkForEmptyName(currentText: String, range: NSRange, string: String)
    func editTask(task: Task, newName: String, newDescription: String)
    func editTask(at index: Int, in section: Int, newName: String, newDescription: String)
}
