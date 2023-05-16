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
    
    func buildTaskDetail(mode: EditAddTaskSetup, task: Task?) -> TaskDetailViewController {
        let taskDetailViewController = TaskDetailViewController(coordinator: coordinator, mode: mode, task: task)
        let taskDetailPresenterImp = TaskDetailPresenterImp(view: taskDetailViewController, taskServiceImp: taskListService)
        taskDetailViewController.presenter = taskDetailPresenterImp
        return taskDetailViewController
    }
}
