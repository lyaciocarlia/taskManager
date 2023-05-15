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
    
    func numberOfTasks() -> Int {
        return tasks.count
    }
    
    func nrOfActiveTasks() -> Int {
        let nrOfActiveTasks = tasks.filter() {
            $0.isCompleted == false
        }
        return nrOfActiveTasks.count
    }
    
    func nrOfCompletedTasks() -> Int {
        let nrOfCompletedTasks = tasks.filter() {
            $0.isCompleted == true
        }
        return nrOfCompletedTasks.count
    }
    
    func getTask(at index: Int, taskList: [Task]) -> Task? {
        return taskList[index]
    }
    
    func parseTaskList(section: Int) -> [Task] {
        var tasks = tasks
        
        if section == 0 {
            tasks = tasks.filter() {
                $0.isCompleted == false
            }
        } else {
            tasks = tasks.filter() {
                $0.isCompleted == true
            }
        }
        print(tasks)
        return tasks
        
    }
    
    func editTask(at index: Int, in section: Int, newName: String, newDescription: String) {
        let tasks = parseTaskList(section: section)
        let taskToEdit = tasks[index]
        for i in self.tasks.indices {
            if self.tasks[i] == taskToEdit {
                self.tasks[i].name = newName
                self.tasks[i].description = newDescription
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
