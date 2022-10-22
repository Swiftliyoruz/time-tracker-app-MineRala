//
//  Task+CoreDataProperties.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 30.09.2022.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var icon: Data?
    @NSManaged public var mainCategory: String?
    @NSManaged public var subCategory: String?
    @NSManaged public var time: Float
    @NSManaged public var title: String?

}

extension Task : Identifiable {

}
