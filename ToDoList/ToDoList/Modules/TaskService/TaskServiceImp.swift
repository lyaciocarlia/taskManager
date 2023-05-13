//
//  TaskServiceImp.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 10.05.2023.
//

import Foundation

class TaskServiceImp: TaskService {
    
    var tasks: [Task] = [
        Task(id: "1", name:"Citit", description: "Sa citesc 30 pag", isCompleted: false),
        Task(id: "3", name: "Merg la sala", description: "", isCompleted: false),
        Task(id: "2", name: "Merg la sala", description: "Antrenament la sala de 120 min", isCompleted: false),
        Task(id: "4", name:"Desenat", description: "Ajut sora la desenat", isCompleted: true),
        Task(id: "5", name: "Merg la sala", description: "Antrenament la sala de 100 min", isCompleted: true)
    ]
    
    var activeTasks: [Task] {
        get {
            tasks.filter { !$0.isCompleted }
        }
        set {
            tasks = newValue + completedTasks
        }
    }
    
    var completedTasks: [Task] {
        get {
            tasks.filter { $0.isCompleted }
        }
        set {
            tasks = newValue + activeTasks
        }
    }
    
    func numberOfTasks() -> Int {
        return tasks.count
    }
    
    func nrOfActiveTasks() -> Int {
        return activeTasks.count
    }
    
    func nrOfCompletedTasks() -> Int {
        return completedTasks.count
    }
    
    func getTask(at index: Int, taskList: [Task]) -> Task? {
        return taskList[index]
    }
    
    func parseTaskList(section: Int) -> [Task] {
        if section == Constants.firstSection && nrOfActiveTasks() != 0 {
            return activeTasks
        } else {
            return completedTasks
        }
    }
    
    func editTask(task:Task, newName: String, newDescription: String) {
        for i in self.tasks.indices {
            if self.tasks[i].id == task.id {
                self.tasks[i].name = newName
                self.tasks[i].description = newDescription
            }
        }
    }
    
    func moveTask(from sourceIndex: IndexPath, to destinationIndex: IndexPath) {
        guard let taskToBeMoved = getTask(at: sourceIndex.row, taskList: parseTaskList(section: sourceIndex.section)) else { return }
        deleteTask(at: sourceIndex.row, in: sourceIndex.section)
        
        if sourceIndex.section == destinationIndex.section {
            if sourceIndex.section == Constants.firstSection {
                activeTasks.insert(taskToBeMoved, at: destinationIndex.row)
            } else {
                completedTasks.insert(taskToBeMoved, at: destinationIndex.row)
            }
        }
    }
        
    func addTask(task: Task) {
        tasks.append(task)
    }
    
    func deleteTask(at index: Int, in section: Int) {
        let tasks = parseTaskList(section: section)
        let taskToRemove = tasks[index]
        for i in self.tasks.indices {
            if self.tasks[i] == taskToRemove {
                self.tasks.remove(at: i)
                break
            }
        }
    }
    
    func getTasksCount(in section: Int) -> Int {
        let tasks = parseTaskList(section: section)
        return tasks.count
    }
}
