//
//  TaskListView.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 06.05.2023.
//

import Foundation

protocol TaskListView: AnyObject {
    func updateEmptyListImage(isHidden: Bool)
}

protocol CellDelegate: AnyObject {
    func markTaskAsComplete(at: IndexPath)
}
