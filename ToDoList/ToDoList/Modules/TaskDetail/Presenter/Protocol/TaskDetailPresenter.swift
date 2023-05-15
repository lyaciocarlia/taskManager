//
//  TaskDetailPresenter.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 09.05.2023.
//

import Foundation

protocol TaskDetailPresenter {
    
    func viewWasLoaded(mode: EditAddTaskSetup, task: Task?)
    func addTask(name: String, description: String)
    func checkForEmptyName(currentText: String, range: NSRange, string: String)
    func editTask(at index: Int, in section: Int, newName: String, newDescription: String)
}
