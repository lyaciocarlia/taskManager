//
//  TaskDetailPresenter.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 09.05.2023.
//

import Foundation

protocol TaskDetailPresenter {
    
    func addTask(name: String, description: String)
    func checkForEmptyName(currentText: String, range: NSRange, string: String) -> Bool}
