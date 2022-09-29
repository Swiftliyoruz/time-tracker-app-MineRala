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
    
    static func addTask(title: String, mainCategory: String, subCategory: String, icon: Data, time: Float) {
        let context = getContext()
        let entitiy = NSEntityDescription.entity(forEntityName: "Task", in: context)
        let task = NSManagedObject(entity: entitiy!, insertInto: context)
        task.setValue(title, forKey: "title")
        task.setValue(mainCategory, forKey: "mainCategory")
        task.setValue(subCategory, forKey: "subCategory")
        task.setValue(icon, forKey: "icon")
        task.setValue(time, forKey: "time")
        
        do {
            try context.save()
            print("Title: \(title), Main Category: \(mainCategory)")
        } catch {
            print("Core Data Add Task Error!!!")
        }
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
