//
//  DataExtensions.swift
//  timer
//
//  Created by Anderson David on 10/28/22.
//

import Foundation
import CoreData

extension Exercise {
    
    static var example: Exercise {
        let context = DataController.dataController.persistentContainer.viewContext
        let e = Exercise(context: context)
        e.name = "Test exercise"
        e.desc = "Test description"
        e.creationDate = Date()
        e.defaultDuration = Int64(60)
        return e
    }
}


extension Event {
    static var example: Event {
        let context = DataController.dataController.persistentContainer.viewContext
        let e = Event(context: context)
        e.displayName = "Test event"
        e.duration = Int64(60)
        return e
    }
}
