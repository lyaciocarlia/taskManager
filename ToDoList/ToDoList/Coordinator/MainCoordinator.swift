//
//  Coordinator.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 04.05.2023.
//

import Foundation
import UIKit

class MainCoordinator {
    
    static func setupTaskListVC() -> TaskListViewController {
        
        let taskListViewController = TaskListViewController()
        let taskListPresenterImp = TaskListPresenterImp(view: taskListViewController)
        
        taskListViewController.presenter = taskListPresenterImp
        
        return taskListViewController
        
    }
    
    static func setupTaskDetailVC() -> TaskDetailViewController {
        
        let taskDetailViewController = TaskDetailViewController()
        let taskDetailPresenterImp = TaskDetailPresenterImp(view: taskDetailViewController)
        
        taskDetailViewController.presenter = taskDetailPresenterImp
        
        return taskDetailViewController
        
    }
    
    static func setupNavigationController() -> NavigationViewController{
        
        let taskListViewController = setupTaskListVC()
        let taskDetailViewController = setupTaskDetailVC()
        let navigationController = NavigationViewController(rootViewController: taskListViewController)
        
        navigationController.viewControllers = [taskListViewController, taskDetailViewController]
        navigationController.visibleViewController?.viewWillAppear(true)

        return navigationController
    }
}
