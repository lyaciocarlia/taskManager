//
//  TaskServiceImp.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 10.05.2023.
//

import Foundation
import CoreData

class TaskServiceImp: TaskService {
    
    private let context = AppDelegate.context
    private var tasks: [TaskEntity] = []
    
    var activeTasks: [Task] {
        get {
            let tasks = convertTaskEntityToTask() ?? [Task]()
            return tasks.filter { !$0.isCompleted }
        }
    }
    
    var completedTasks: [Task] {
        get {
            let tasks = convertTaskEntityToTask() ?? [Task]()
            return tasks.filter { $0.isCompleted }
        }
    }
    
    private func refreshTasks() {
        guard let tasks = getTasksFromDB() else { return }
        self.tasks = tasks.sorted {
            $0.actionDate < $1.actionDate
        }
    }
    
    func getTasksFromDB() -> [TaskEntity]? {
        do {
            return try context.fetch(TaskEntity.fetchRequest())
        } catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func convertTaskEntityToTask() -> [Task]? {
        guard let coreTasks = getTasksFromDB() else { return nil }
        let tasks = coreTasks.map { coreTask in
            let id = coreTask.id?.uuidString ?? ""
            let name = coreTask.name ?? ""
            let description = coreTask.detail  ?? ""
            let isCompleted = coreTask.isCompleted
            let actionDate = coreTask.actionDate
            
            return Task(id: id, name: name, description: description, isCompleted: isCompleted, actionDate: actionDate)
        }
        return tasks
    }
    
    func numberOfTasks() -> Int {
        return getTasksFromDB()?.count ?? Constants.zeroTasks
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
    
    private func saveContext() {
        do {
            try context.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    private func getDBTaskIndex(task: Task) -> Int? {
        refreshTasks()
        guard let index = (tasks.firstIndex { $0.id?.uuidString == task.id }) else { return nil }
        return index
    }
    
    func editTask(task:Task, newName: String, newDescription: String) {
        guard let taskIndex = getDBTaskIndex(task: task) else { return }
        tasks[taskIndex].name = newName
        tasks[taskIndex].detail = newDescription
        saveContext()
    }
    
    func changeTaskState(at index: IndexPath) {
        guard let task = getTask(at: index.row, taskList: parseTaskList(section: index.section)) else { return }
        guard let taskIndex = getDBTaskIndex(task: task) else { return }
        tasks[taskIndex].isCompleted =  !tasks[taskIndex].isCompleted
        saveContext()
    }
    
    private func reasignDate() {
        for task in tasks {
            task.actionDate = Date()
        }
        saveContext()
    }
    
    func moveTask(from sourceIndex: IndexPath, to destinationIndex: IndexPath) {
        refreshTasks()
        
        guard let taskToBeMoved = getTask(at: sourceIndex.row, taskList: parseTaskList(section: sourceIndex.section)) else { return }
        print(taskToBeMoved.actionDate)
        let taskMovedIndex = tasks.firstIndex(where: { task in
            task.actionDate == taskToBeMoved.actionDate
        })
        
        let task = tasks.remove(at: taskMovedIndex!)
        tasks.insert(task, at: destinationIndex.row)
        
        reasignDate()
    }
    
    func addTask(task: Task) {
        let taskToAdd = TaskEntity(context: context)
        taskToAdd.id = UUID()
        taskToAdd.name = task.name
        taskToAdd.detail = task.description
        taskToAdd.isCompleted = false
        taskToAdd.actionDate = task.actionDate
        saveContext()
        refreshTasks()
    }
    
    func deleteTask(at index: Int, in section: Int) {
        let tasks = parseTaskList(section: section)
        let taskToRemove = tasks[index]
        guard let taskToRemoveIndex = getDBTaskIndex(task: taskToRemove) else { return }
        context.delete(self.tasks[taskToRemoveIndex])
        saveContext()
    }
}
