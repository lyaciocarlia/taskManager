//
//  TaskService.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 10.05.2023.
//

import Foundation

protocol TaskService {
    var activeTasks: [Task] {get set}
    var completedTasks: [Task] {get set}
    
    func numberOfTasks() -> Int
    func getTask(at index: Int, section: Int) -> Task?
    func getTasksCount(in section: Int) -> Int
    func addTask(task: Task)
    func deleteTask(at index: Int, in section: Int) 
}
