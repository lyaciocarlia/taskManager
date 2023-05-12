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
    
    func rootVC() -> UIViewController {
        let navigationController = TaskMgNavigationViewController(rootViewController: taskListBuilder.buildTaskList())
        return navigationController
    }
}
