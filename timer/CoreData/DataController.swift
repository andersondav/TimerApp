//
//  DataController.swift
//  timer
//
//  Created by Anderson David on 8/22/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "TimerApp")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load core data: \(error.localizedDescription)")
            }
        }
    }
}
