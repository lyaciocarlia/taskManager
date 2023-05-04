//
//  Coordinator.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 04.05.2023.
//

import Foundation
import UIKit

class MainCoordinator{
    //lazy var taskListPresenterImp = TaskListPresenterImp(view: taskListViewController)
    static func setupListOfTasks() -> TaskListViewController{
        let taskListViewController = TaskListViewController()
        let taskListPresenterImp = TaskListPresenterImp(view: taskListViewController)
        taskListViewController.presenter = taskListPresenterImp
        return taskListViewController
    }
}
