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
        
        let taskService = TaskServiceImp()
        let mainCoordinator = MainCoordinator(with: taskService)
        
        window?.rootViewController = mainCoordinator.rootVC()
        window?.makeKeyAndVisible()
        
        return true
    }
    
}
