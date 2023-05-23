//
//  TaskService.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 10.05.2023.
//

import Foundation

protocol TaskService {
    func editTask(task: Task, newName: String, newDescription: String)
    func numberOfTasks() -> Int
    func getTask(at index: Int, taskList: [Task]) -> Task?
    func addTask(task: Task)
    func deleteTask(at index: Int, in section: Int)
    func nrOfActiveTasks() -> Int
    func nrOfCompletedTasks() -> Int
    func parseTaskList(section: Int) -> [Task]
    func moveTask(from sourceIndex: IndexPath, to destinationIndex: IndexPath)
    func changeTaskState(at index: IndexPath)
}
