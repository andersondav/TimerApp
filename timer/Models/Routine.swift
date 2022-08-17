//
//  Routine.swift
//  timer
//
//  Created by Anderson David on 8/17/22.
//

import Foundation

struct Routine {
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
}
