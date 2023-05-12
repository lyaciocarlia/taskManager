//
//  TaskListPresenterProtocol.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 04.05.2023.
//

import Foundation

protocol TaskListPresenter {
    
    func checkForEmtpyList() -> Bool
    func activeTasksCount() -> Int
    func completedTasksCount() -> Int
    func getTask(at index: Int, section: Int) -> Task?
    func getTasksCount(in section: Int) -> Int
    func viewWillApear()
    func deleteTask(at index: Int, in section: Int)
    func returnTaskName(at index: Int, section: Int) -> String
    func returnTaskDescription(at index: Int, section: Int) -> String
}
