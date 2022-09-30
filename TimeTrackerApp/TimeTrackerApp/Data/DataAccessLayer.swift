//
//  DataAccessLayer.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 29.09.2022.
//

import UIKit
import CoreData

final class DataAccessLayer {
    static func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    static func addTask(task: Task) {
        do {
            try self.getContext().save()
        }
        catch {
            print("Core Data Add Task Error!!!")
        }
        print(task.self)
    }
    
    static func fetchTasks() -> [Task]? {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            return try getContext().fetch(fetchRequest)
        } catch {
            print("Fetch Tasks Error!!!")
        }
        return nil
    }
    
    static func deleteTask(task: Task) {
        getContext().delete(task)
        try? getContext().save()
    }
}
