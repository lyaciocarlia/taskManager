//
//  NavigationController.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 09.05.2023.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.titleTextAttributes = [.font : Constants.navigationTitleFont, .strokeColor: UIColor.red]
        self.navigationBar.shadowImage = .none
        self.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
  
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
