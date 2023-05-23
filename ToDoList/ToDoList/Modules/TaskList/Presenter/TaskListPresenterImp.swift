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
        return taskServiceImp.nrOfActiveTasks()
    }
    
    func completedTasksCount() -> Int {
        return taskServiceImp.nrOfCompletedTasks()
    }
    
    func getTask(at index: Int, section: Int) -> Task? {
        let tasks = taskServiceImp.parseTaskList(section: section)
        return taskServiceImp.getTask(at: index, taskList: tasks)
    }
    
    func getTasksCount(in section: Int) -> Int {
        return section == Constants.firstSection ? taskServiceImp.nrOfActiveTasks() : taskServiceImp.nrOfCompletedTasks()
    }
    
    func viewWillAppear() {
        view?.updateEmptyListImage(isHidden: taskServiceImp.numberOfTasks() == Constants.zeroTasks)
    }
    
    func moveTask(from sourceIndex: IndexPath, to destinationIndex: IndexPath) {
        taskServiceImp.moveTask(from: sourceIndex, to: destinationIndex)
    }
    
    func changeTaskState(at index: IndexPath) {
        taskServiceImp.changeTaskState(at: index)
    }
}
