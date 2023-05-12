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

    func setupTaskDetailVC(situation: String, taskName: String, taskDescription: String) -> TaskDetailViewController{
        var taskDetailVC = taskDetailBuilder.buildTaskDetail()
        if situation == "AddTask"{
            taskDetailVC.saveChangesButton.setTitle("Create Task", for: .normal)
            taskDetailVC.title = "Add Task"
            taskDetailVC.taskNameTextField.placeholder = "Enter your title..."
            taskDetailVC.taskDescriptionTextField.placeholder = "Enter an optinal subtitle..."
        } else {
            taskDetailVC.saveChangesButton.setTitle("Update Task", for: .normal)
            taskDetailVC.title = "Edit Task"
            taskDetailVC.taskNameTextField.text = taskName
            taskDetailVC.taskDescriptionTextField.text = taskDescription
        }
        return taskDetailVC
    }
    
    func rootVC() -> UIViewController {
        let navigationController = TaskMgNavigationViewController(rootViewController: taskListBuilder.buildTaskList())
        return navigationController
    }
}
