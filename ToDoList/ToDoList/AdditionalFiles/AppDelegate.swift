//
//  AppDelegate.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 01.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        var taskService = TaskServiceImp()
        var mainCoordinator = MainCoordinator(with: taskService)
        
        let navigationController = UINavigationController(rootViewController: MainCoordinator.setupTaskListVC())
        navigationController.navigationBar.titleTextAttributes = [.font : Constants.navigationTitleFont, .strokeColor: UIColor.red]
        navigationController.navigationBar.shadowImage = .none
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationItem.largeTitleDisplayMode = .always
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
    
}
