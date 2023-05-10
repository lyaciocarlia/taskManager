//
//  TaskDetailView.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 09.05.2023.
//

import Foundation
import UIKit

protocol TaskDetailView: AnyObject {
    var taskDescriptionTextField: UITextField! { get set }
    var taskNameTextField: UITextField! { get set }
    var saveChangesButton: UIButton! { get set }
}
