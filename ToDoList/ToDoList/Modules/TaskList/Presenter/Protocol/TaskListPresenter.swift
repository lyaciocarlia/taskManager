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
    
    func checkForEmtpyList() -> Bool
    
}
