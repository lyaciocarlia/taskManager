//
//  TaskDetailPresenter.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 09.05.2023.
//

import Foundation

class TaskDetailPresenterImp: TaskDetailPresenter {
    weak var view: TaskDetailView?

    init(view: TaskDetailViewController) {
        self.view = view
    }
    func addTask() {
        
    }
}
