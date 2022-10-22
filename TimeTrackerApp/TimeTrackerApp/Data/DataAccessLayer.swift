//
//  DataAccessLayer.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 29.09.2022.
//

import UIKit
import CoreData

final class DataAccessLayer {
    // Singelton - static diffrence ? 
    // complexity değeri O(1) olduğu için fonksiyon yerine computed property yapmak daha verimli.
    static var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    static func addTask(task: Task) {
        do {
            try context.save()
        }
        catch {
            print("Core Data Add Task Error!!!")
        }
        print(task.self)
    }
    
    static func fetchTasks() -> [Task]? {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Fetch Tasks Error!!!")
        }
        return nil
    }
    
    static func deleteTask(task: Task) {
        context.delete(task)
        try? context.save()
    }
}
