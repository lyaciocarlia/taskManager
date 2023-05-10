//
//  TaskDetailPresenter.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 09.05.2023.
//

import Foundation

protocol TaskDetailPresenter {
    var view: TaskDetailView? { get set }
    var taskServiceImp: TaskService { get set }
}
