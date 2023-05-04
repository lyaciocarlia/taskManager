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
        Task(id: "2", name: "Merg la sala", description: "Antrenament la sala de 120 min", isCompleted: false)
    ]
    var completedTasks: [Task] = [
        Task(id: "3", name:"Desenat", description: "Ajut sora la desenat", isCompleted: true),
        Task(id: "4", name: "Merg la sala", description: "Antrenament la sala de 100 min", isCompleted: true)
    ]
    func addTask(task: Task){
        activeTasks.append(task)
    }
    func toggleTaskCompleted(at index: Int) {
        if index < activeTasks.count {
                var task = activeTasks.remove(at: index)
                   task.isCompleted = true
                   completedTasks.append(task)
               } else {
                   var task = completedTasks.remove(at: index - activeTasks.count)
                   task.isCompleted = false
                   activeTasks.append(task)
               }
               
               // Actualizarea View-ului
              // view?.reloadData()
    }
    
    func getTask(at index: Int, section: Int) -> Task? {
        if index < activeTasks.count && section == 0{
                    return activeTasks[index]
                } else {
                    return completedTasks[index]
                }
           }
    
    func getTasksCount() -> Int {
            return activeTasks.count + completedTasks.count
        }
}
