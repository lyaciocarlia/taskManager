//
//  Builder.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 10.05.2023.
//

import Foundation

class TaskListBuilder {
    private let taskListService: TaskService
    private let coordinator: MainCoordinator
    
    init(taskListService: TaskService, coordinator: MainCoordinator) {
        self.taskListService = taskListService
        self.coordinator = coordinator
    }
    
    func buildTaskList() -> TaskListViewController {
        let taskListViewController = TaskListViewController(coordinator: coordinator)
        let taskListPresenterImp = TaskListPresenterImp(view: taskListViewController, taskServiceImp: taskListService)
        taskListViewController.presenter = taskListPresenterImp
        return taskListViewController
    }
}

