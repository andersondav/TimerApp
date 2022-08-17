//
//  Event.swift
//  timer
//
//  Created by Anderson David on 8/17/22.
//

import Foundation

protocol Event {
    var displayName: String { get }
    var displayDescription: String? { get }
}

struct ExerciseEvent: Event {
    var exercise: Exercise
    
    var duration: Int
    
    var displayName: String {
        get { return exercise.name }
        set(newName) { exercise.name = newName }
    }
    
    var displayDescription: String? {
        get { return exercise.description }
        set(newDescription) { exercise.description = newDescription }
    }
}

struct RestEvent: Event {
    var duration: Int
    
    var displayName: String {
        get { return "Rest" }
    }
    
    var displayDescription: String? {
        get { return nil }
    }
}
