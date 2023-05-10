//
//  TaskListPresenterProtocol.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 04.05.2023.
//

import Foundation

protocol TaskListPresenter {
    
    var view: TaskListView? { get set }
    var taskServiceImp: TaskService { get set }
//    var activeTasks: [Task] { get set }
//    var completedTasks: [Task] { get set }
    
    func checkForEmtpyList() -> Bool
    func deleteTask(at index: Int, in section: Int)
//    func numberOfTasks() -> Int
//    func getTask(at index: Int, section: Int) -> Task?
//    func getTasksCount(in section: Int) -> Int
    
}
