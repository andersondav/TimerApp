//
//  DataController.swift
//  timer
//
//  Created by Anderson David on 8/22/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    static let dataController = DataController()
    
    public static var moc: NSManagedObjectContext {
        get {
            return dataController.persistentContainer.viewContext
        }
    }
    
    let persistentContainer = NSPersistentContainer(name: "TimerApp")

    init() {
        self.persistentContainer.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load core data: \(error.localizedDescription)")
            }
        }
    }
}
