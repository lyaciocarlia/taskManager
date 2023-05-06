//
//  TaskListPresenterProtocol.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 04.05.2023.
//

import Foundation

protocol TaskListPresenter {
    
    var view: TaskListView? {get set}
    var activeTasks: [Task] {get set}
    var completedTasks: [Task] {get set}
    
    func checkForEmtpyList()
    func numberOfTasks() -> Int
    func getTask(at index: Int, section: Int) -> Task?
    func getTasksCount(in section: Int) -> Int
    
}
