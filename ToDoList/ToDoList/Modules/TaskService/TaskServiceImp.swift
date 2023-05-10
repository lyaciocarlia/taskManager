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
    
}
