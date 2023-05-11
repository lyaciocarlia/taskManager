//
//  NavigationController.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 09.05.2023.
//

import UIKit

class TaskMgNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
    }
    
    func setupNavigationController() {
        navigationBar.titleTextAttributes = [.font: Constants.navigationTitleFont]
        navigationBar.shadowImage = .none
        navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}
