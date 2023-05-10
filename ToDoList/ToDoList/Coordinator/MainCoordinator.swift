//
//  Coordinator.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 04.05.2023.
//

import Foundation
import UIKit

class MainCoordinator {
    
    var taskService: TaskService
    
    lazy var taskListBuilder = TaskListBuilder(taskListService: taskService, coordinator: self)
    lazy var taskDetailBuilder = TaskDetailBuilder(taskListService: taskService, coordinator: self)
    
    init(with taskService: TaskService) {
        self.taskService = taskService
    }
    
//    static func setupTaskListVC() -> TaskListViewController {
//
//        let taskListViewController = TaskListViewController()
//        let taskListPresenterImp = TaskListPresenterImp(view: taskListViewController)
//
//        taskListViewController.presenter = taskListPresenterImp
//
//        return taskListViewController
//
//    }
    
    func rootVC() -> UIViewController {
        let navigationController = TaskMgNavigationViewController(rootViewController: taskListBuilder.buildTaskList())
        return navigationController
    }
    
//    static func setupTaskDetailVC() -> TaskDetailViewController {
//
//        let taskDetailViewController = TaskDetailViewController()
//        let taskDetailPresenterImp = TaskDetailPresenterImp(view: taskDetailViewController)
//
//        taskDetailViewController.presenter = taskDetailPresenterImp
//
//        return taskDetailViewController
//
//    }
    
}
