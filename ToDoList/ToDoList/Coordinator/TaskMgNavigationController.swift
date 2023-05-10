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
        self.setupNavigationController()
    }
    
    func setupNavigationController() {
        self.navigationBar.titleTextAttributes = [.font : Constants.navigationTitleFont]
        self.navigationBar.shadowImage = .none
        self.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
    }
  
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
