//
//  TaskService.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 10.05.2023.
//

import Foundation

protocol TaskService {
    var activeTasks: [Task] {get set}
    var completedTasks: [Task] {get set}
    
    
}
