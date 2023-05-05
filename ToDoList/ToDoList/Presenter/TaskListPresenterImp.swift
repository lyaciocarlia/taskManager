//
//  Presenter.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 04.05.2023.
//

import Foundation

class TaskListPresenterImp: TaskListPresenter {
    
    weak var view: TaskListViewController?
    
    init(view: TaskListViewController) {
        self.view = view
    }
    
    var activeTasks: [Task] = [
        Task(id: "1", name:"Citit", description: "Sa citesc 30 pag", isCompleted: false),
        Task(id: "3", name: "Merg la sala", description: "", isCompleted: false),
        Task(id: "2", name: "Merg la sala", description: "Antrenament la sala de 120 min", isCompleted: false)
    ]
    
    var completedTasks: [Task] = [
        Task(id: "4", name:"Desenat", description: "Ajut sora la desenat", isCompleted: true),
        Task(id: "5", name: "Merg la sala", description: "Antrenament la sala de 100 min", isCompleted: true)
    ]
    
    func getTask(at index: Int, section: Int) -> Task? {
        if index < activeTasks.count && section == Constants.firstSection {
            return activeTasks[index]
        } else {
            return completedTasks[index]
        }
    }
    
    func getTasksCount(in section: Int) -> Int {
        if section == Constants.firstSection {
            return activeTasks.count
        } else {
            return completedTasks.count
        }
    }
}
