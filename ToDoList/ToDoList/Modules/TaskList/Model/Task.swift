//
//  Task.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 04.05.2023.
//

import Foundation

struct Task: Equatable {
    
    let id: UUID
    var name: String
    var description: String
    var isCompleted: Bool
    var actionDate: Date
    
}
