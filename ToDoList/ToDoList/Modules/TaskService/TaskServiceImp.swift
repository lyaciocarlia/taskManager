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
    
    func editTask(at index: Int, in section: Int, newName: String, newDescription: String) {
        if section == 0 {
            activeTasks[index].name = newName
            activeTasks[index].description = newDescription
        } else {
            completedTasks[index].name = newName
            completedTasks[index].description = newDescription
        }
        
    }
    
    func addTask(task: Task) {
        activeTasks.append(task)
    }
    
    func deleteTask(at index: Int, in section: Int) {
        if section == 0 {
            activeTasks.remove(at: index)
        } else {
            completedTasks.remove(at: index)
        }
    }
    
    func getTasksCount(in section: Int) -> Int {
        if section == Constants.firstSection && activeTasks.count != 0 {
            return activeTasks.count
        } else {
            return completedTasks.count
        }
    }
}
