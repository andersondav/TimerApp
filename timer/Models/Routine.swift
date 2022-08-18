//
//  Routine.swift
//  timer
//
//  Created by Anderson David on 8/17/22.
//

import Foundation

class Routine {
    var creationDate: Date
    
    var name: String
    var description: String?
    
    /*
     List of exercises/rests that are part of the routine (in order)
     */
    var events: [Event]
    
    /*
     If not null, this value will be used to add rests between each exercise when the routine is initially created, and to add rest when adding a new exercise while editing the routine
     */
    var restLength: Int?
    
    /*
     If not null and ETO is disabled, all exercises added to this routine will have this duration on routine creation (can be edited later)
     If null or ETO is enabled, all exercises added to this routine will have their own duration
     */
    var defaultExerciseDuration: Int?
    
    init(creationDate: Date, name: String, description: String? = nil, restLength: Int? = nil, defaultExerciseDuration: Int? = nil) {
        self.creationDate = creationDate
        self.name = name
        self.description = description
        self.restLength = restLength
        self.defaultExerciseDuration = defaultExerciseDuration
        self.events = []
    }
    
    static func convertEventsToData(events: [Event]) -> Data? {
        do {
            return try NSKeyedArchiver.archivedData(withRootObject: events, requiringSecureCoding: true)
        } catch {
            print("Could not convert events \(events) to data")
        }
        
        return Data(capacity: 0)
    }
    
    static func convertDataToEvents(data: Data) -> [Event] {
        guard let events = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NSArray.self, from: data) as? [Event] else {
            return []
        }
        
        return events
    }
}
