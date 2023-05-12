//
//  Presenter.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 04.05.2023.
//

import Foundation

class TaskListPresenterImp: TaskListPresenter {
    
    weak var view: TaskListView?
    
    var taskServiceImp: TaskService
    
    init(view: TaskListViewController, taskServiceImp: TaskService) {
        self.view = view
        self.taskServiceImp = taskServiceImp
    }
    
    func checkForEmtpyList() -> Bool {
        return taskServiceImp.numberOfTasks() == 0
    }
    
    func activeTasksCount() -> Int {
        return taskServiceImp.activeTasks.count
    }
    
    func completedTasksCount() -> Int {
        return taskServiceImp.completedTasks.count
    }
    
    func getTask(at index: Int, section: Int) -> Task? {
        return taskServiceImp.getTask(at: index, section: section)
    }
    
    func getTasksCount(in section: Int) -> Int {
        return taskServiceImp.getTasksCount(in: section)
    }
    
    func viewWillLayoutSubviews() {
        if taskServiceImp.numberOfTasks() == 0 {
            view?.updateEmptyListImage(isHidden: true)
        } else {
            view?.updateEmptyListImage(isHidden: false)
        }
    }
}
