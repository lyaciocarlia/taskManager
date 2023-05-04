//
//  TaskListPresenterProtocol.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 04.05.2023.
//

import Foundation

protocol TaskListPresenter {
    var view: TaskListViewController? {get set}
    var activeTasks: [Task] {get set}
    var completedTasks: [Task] {get set}
    func addTask(task: Task)
    func toggleTaskCompleted(at index: Int)
    func getTask(at index: Int, section: Int) -> Task?
    func getTasksCount() -> Int
}
