//
//  TaskEntity+CoreDataProperties.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici  on 22.05.2023.
//
//

import Foundation
import CoreData


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String?
    @NSManaged public var detail: String?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var actionDate: Date

}

extension TaskEntity : Identifiable {

}
