//
//  Builder.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 10.05.2023.
//

import Foundation

class TaskDetailBuilder {
    
    private let taskListService: TaskService
    private let coordinator: MainCoordinator
    
    init(taskListService: TaskService, coordinator: MainCoordinator) {
        self.taskListService = taskListService
        self.coordinator = coordinator
    }
    
    func buildTaskDetail(situation: String, taskName: String?, taskDescription: String?, index: Int?, section: Int?) -> TaskDetailViewController {
        let taskDetailViewController = TaskDetailViewController(coordinator: coordinator, situation: situation, taskName: taskName, taskDescription: taskDescription, index: index, section: section )
        let taskDetailPresenterImp = TaskDetailPresenterImp(view: taskDetailViewController, taskServiceImp: taskListService)
        taskDetailViewController.presenter = taskDetailPresenterImp
        return taskDetailViewController
    }
}
