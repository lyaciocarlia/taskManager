//
//  TaskDetailView.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 09.05.2023.
//

import Foundation
import UIKit

protocol TaskDetailView: AnyObject {
    func updateSaveChangesButtonState(state: Bool)
}
