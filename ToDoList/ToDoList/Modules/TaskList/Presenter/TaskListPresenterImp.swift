//
//  Presenter.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 04.05.2023.
//

import Foundation

class TaskListPresenterImp: TaskListPresenter {
    
    unowned let view: TaskListView?
    
    private let taskServiceImp: TaskService
    
    init(view: TaskListViewController, taskServiceImp: TaskService) {
        self.view = view
        self.taskServiceImp = taskServiceImp
    }
    
    func deleteTask(at index: Int, in section: Int) {
        taskServiceImp.deleteTask(at: index, in: section )
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
    
    func viewWillApear() {
        if taskServiceImp.numberOfTasks() == 0 {
            view?.updateEmptyListImage(isHidden: true)
        }
    }
    
    func returnTaskName(at index: Int, section: Int) -> String {
        return getTask(at: index, section: section)?.name ?? ""
    }
    
    func returnTaskDescription(at index: Int, section: Int) -> String {
        return getTask(at: index, section: section)?.description ?? " "
    }
}
