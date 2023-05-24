//
//  ToDoListTests.swift
//  ToDoListTests
//
//  Created by Iuliana Stecalovici  on 23.05.2023.
//

import XCTest
@testable import ToDoList
import CoreData


final class ToDoListTests: XCTestCase {
    
    var reportService: TaskService!
    var coreDataStack: CoreDataStack!
    
    override func setUp() {
        super.setUp()
        coreDataStack = TestCoreDataStack()
        reportService = TaskServiceImp (
            managedObjectContext: coreDataStack.mainContext,
            coreDataStack: coreDataStack)
        
        continueAfterFailure = false
        
    }
    
    override func tearDown() {
        super.tearDown()
        reportService = nil
        coreDataStack = nil
    }
    
    func testNrOfCompletedTasks() {
        
        let completedTasks = [
            Task(id: UUID(), name: "3", description: "De citit", isCompleted: true, actionDate: Date()),
            Task(id: UUID(), name: "4", description: "De citit", isCompleted: true, actionDate: Date())
        ]
        
        let tasks = [
            Task(id: UUID(), name: "1", description: "De citit", isCompleted: false, actionDate: Date()),
            Task(id: UUID(), name: "2", description: "De citit", isCompleted: false, actionDate: Date()),
            completedTasks[0],
            completedTasks[1]
        ]
    
        tasks.forEach {reportService.addTask(task: $0) }
        
        let result = reportService.nrOfCompletedTasks()
        
        XCTAssertEqual(result, completedTasks.count, "Did not count the active tasks correct")
        
        print("Test for number of active tasks passed successfully ✅")
        
    }
    
    func testNrOfActiveTasks() {
        let activeTasks = [
            Task(id: UUID(), name: "3", description: "De citit", isCompleted: false, actionDate: Date()),
            Task(id: UUID(), name: "4", description: "De citit", isCompleted: false, actionDate: Date())
        ]
        
        let tasks = [
            Task(id: UUID(), name: "1", description: "De citit", isCompleted: true, actionDate: Date()),
            Task(id: UUID(), name: "2", description: "De citit", isCompleted: true, actionDate: Date()),
            activeTasks[0],
            activeTasks[1]
        ]
    
        tasks.forEach {reportService.addTask(task: $0) }
        
        let result = reportService.nrOfActiveTasks()
        
        XCTAssertEqual(result, activeTasks.count, "Did not count the active tasks correct")
        
        print("Test for number of active tasks passed successfully ✅")
        
    }
    
    func testParseTaskList() {
        
        let activeTasks = [
            Task(id: UUID(), name: "3", description: "De citit", isCompleted: false, actionDate: Date()),
            Task(id: UUID(), name: "4", description: "De citit", isCompleted: false, actionDate: Date())
        ]
        
        let tasks = [
            Task(id: UUID(), name: "1", description: "De citit", isCompleted: true, actionDate: Date()),
            Task(id: UUID(), name: "2", description: "De citit", isCompleted: true, actionDate: Date()),
            activeTasks[0],
            activeTasks[1]
        ]
    
        tasks.forEach {reportService.addTask(task: $0) }
        
        let result = reportService.parseTaskList(section: 0)
        
        XCTAssertEqual(result, activeTasks.reversed(), "Did not parse correct")
        
        print("Test for parse tasks passed successfully ✅")
    }
    
    func testNumberOfTasks() {
        
        let firstResult = reportService.numberOfTasks()
        
        XCTAssertEqual(firstResult, 0)
        
        let tasks = [
            Task(id: UUID(), name: "Citeste", description: "De citit", isCompleted: false, actionDate: Date()),
            Task(id: UUID(), name: "Citeste carti", description: "De citit", isCompleted: false, actionDate: Date())
        ]
        
        tasks.forEach {reportService.addTask(task: $0)}
        
        let result = reportService.numberOfTasks()
        XCTAssertEqual(result, 2, "Did not count correct")
        
        print("Test for number of tasks passed successfully ✅")
    }
    
    func testAddTask() {
        let beforeTasks = reportService.getTasksFromDB()
        XCTAssertNil(beforeTasks, "Is not nill")
        
        let taskToAdd = Task(id: UUID(), name: "Citeste carti", description: "De citit", isCompleted: false, actionDate: Date())
        reportService.addTask(task: taskToAdd )
        
        let afterTasks = reportService.getTasksFromDB()
        
        XCTAssertNotNil(afterTasks, "Task wasnt add")
        XCTAssertEqual(afterTasks!.count, 1, "Task dublicated")
        
        XCTAssertEqual(afterTasks!.first!.id, taskToAdd.id, "Task didnt add correct")
        print("Test for add task passed successfully ✅")
    }
    
    func testGetTask() {
        
        let tasks = [
            Task(id: UUID(), name: "Citeste", description: "De citit", isCompleted: false, actionDate: Date()),
            Task(id: UUID(), name: "Citeste carti", description: "De citit", isCompleted: false, actionDate: Date())
        ]
        
        tasks.forEach {reportService.addTask(task: $0)}
        
        XCTAssertNotNil(reportService.getTasksFromDB(), "Cant get tasks")
        XCTAssertEqual(reportService.getTasksFromDB()?.count, tasks.count, "Are not extracted correctly")
        
        print("Test for get task passed successfully ✅")
    }
    
    func testDeleteTask() {
        
        let tasks = [
            Task(id: UUID(), name: "Citeste", description: "De citit", isCompleted: false, actionDate: Date()),
            Task(id: UUID(), name: "Citeste carti", description: "De citit", isCompleted: false, actionDate: Date())
        ]
        
        tasks.forEach { reportService.addTask(task: $0) }
        
        let tasksBefore = reportService.getTasksFromDB()
        
        reportService.deleteTask(at: 0, in: 0)
        
        let deletedTask = tasksBefore![0]
        let tasksAfter = reportService.getTasksFromDB()
        
        XCTAssertEqual(tasksAfter?.count, tasks.count - 1, "Task was not deleted")
        XCTAssertFalse(tasksAfter!.contains(deletedTask), "Wrong task deleted")
        
        print("Test for delete task passed successfully ✅")
    }
    
    func testGetTaskFromDB() {
        
        let firstTask = Task(id: UUID(), name: "Citeste", description: "De citit", isCompleted: false, actionDate: Date())
        let secondTask = Task(id: UUID(), name: "Citeste carti", description: "De citit", isCompleted: false, actionDate: Date())
        
        reportService.addTask(task:firstTask)
        reportService.addTask(task:secondTask)
        
        let result = reportService.getTasksFromDB()
        
        XCTAssertNotNil(result, "Is nill")
        XCTAssertEqual(result?.count, 2, "Count is wrong")
        XCTAssertEqual(result?.first!.id, secondTask.id, "Does not equal" )
        
    }
    
    func testToggleCompleted() {
        
        let task = Task(id: UUID(), name: "Citeste", description: "De citit", isCompleted: false, actionDate: Date())
        reportService.addTask(task: task)
        
        reportService.changeTaskState(at: IndexPath(row: 0, section: 0))
        
        let tasksAfter = reportService.getTasksFromDB()
        
        XCTAssertNotNil(tasksAfter, "Wrong operation")
        XCTAssertEqual(task.id, tasksAfter!.first!.id, "Wrong task selected")
        XCTAssertNotEqual(task.isCompleted, tasksAfter!.first!.isCompleted, "Task didnt switched status")
        
        print("Test for toggle completed task passed successfully ✅")
    }
    
    func testEditTask() {
        
        let task = Task(id: UUID(), name: "Citeste", description: "De citit", isCompleted: false, actionDate: Date())
        reportService.addTask(task: task)
        
        reportService.editTask(task: task, newName: "Anna", newDescription: "")
        
        let tasksAfter = reportService.getTasksFromDB()
        
        XCTAssertNotNil(tasksAfter, "Wrong operation")
        XCTAssertEqual(task.id, tasksAfter!.first!.id, "Wrong task selected")
        XCTAssertNotEqual(task.name, tasksAfter!.first!.name, "Did not edit")
        
        print("Test for edit task passed successfully ✅")
    }
    
    
    func testRearrangeTasks() {
        
        let tasks = [
            Task(id: UUID(), name: "Citeste", description: "De citit", isCompleted: false, actionDate: Date()),
            Task(id: UUID(), name: "Citeste carti", description: "De citit", isCompleted: false, actionDate: Date())
        ]
        
        tasks.forEach { reportService.addTask(task: $0) }
        
        let tasksBefore = reportService.getTasksFromDB()
        
        reportService.moveTask(from: IndexPath(row: 0, section: 0), to: IndexPath(row: 1, section: 0))
        
        let tasksAfter = reportService.getTasksFromDB()
        
        XCTAssertNotEqual(tasksBefore, tasksAfter, "Did not rearrange")
        
        print("Test for rearrange tasks passed successfully ✅")
        
    }
}
