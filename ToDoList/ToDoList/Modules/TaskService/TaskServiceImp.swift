//
//  TaskServiceImp.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 10.05.2023.
//

import Foundation

class TaskServiceImp: TaskService {
    var activeTasks: [Task] = [
        Task(id: "1", name:"Citit", description: "Sa citesc 30 pag", isCompleted: false),
        Task(id: "3", name: "Merg la sala", description: "", isCompleted: false),
        Task(id: "2", name: "Merg la sala", description: "Antrenament la sala de 120 min", isCompleted: false)
    ]
    
    var completedTasks: [Task] = [
        Task(id: "4", name:"Desenat", description: "Ajut sora la desenat", isCompleted: true),
        Task(id: "5", name: "Merg la sala", description: "Antrenament la sala de 100 min", isCompleted: true)
    ]
    
    func numberOfTasks() -> Int {
        return activeTasks.count + completedTasks.count
    }
    
    func getTask(at index: Int, section: Int) -> Task? {
        if index < activeTasks.count && section == Constants.firstSection {
            return activeTasks[index]
        } else {
            return completedTasks[index]
        }
    }
    
    func addTask(task: Task) {
        activeTasks.append(task)
    }
    
    func getTasksCount(in section: Int) -> Int {
        if section == Constants.firstSection && activeTasks.count != 0{
            return activeTasks.count
        } else {
            return completedTasks.count
        }
    }
    
}
