//
//  Event.swift
//  timer
//
//  Created by Anderson David on 8/17/22.
//

import Foundation

protocol Event: NSObject, NSSecureCoding {
    var displayName: String { get }
    var displayDescription: String? { get }
}

public class ExerciseEvent: NSObject, Event, NSSecureCoding {
    public static var supportsSecureCoding: Bool = true
    
    public func encode(with coder: NSCoder) {
        coder.encode(exercise, forKey: keys.exercise.rawValue)
        coder.encode(duration, forKey: keys.duration.rawValue)
    }
    
    public required convenience init?(coder: NSCoder) {
        let decodedExercise: Exercise = coder.decodeObject(of: Exercise.self, forKey: keys.exercise.rawValue) ?? Exercise.placeholder
        let decodedDuration: Int = coder.decodeInteger(forKey: keys.duration.rawValue)
        
        self.init(exercise: decodedExercise, duration: decodedDuration)
    }
    
    enum keys: String {
        case exercise = "exercise"
        case duration = "duration"
    }
    
    public var exercise: Exercise
    public var duration: Int
    
    public init(exercise: Exercise, duration: Int) {
        self.exercise = exercise
        self.duration = duration
    }
    
    public var displayName: String {
        get { return exercise.name }
        set(newName) { exercise.name = newName }
    }
    
    public var displayDescription: String? {
        get { return exercise.desc }
        set(newDesc) { exercise.desc = newDesc }
    }
}

class RestEvent: NSObject, Event, NSSecureCoding {
    public static var supportsSecureCoding: Bool = true
    
    public func encode(with coder: NSCoder) {
        coder.encode(duration, forKey: keys.duration.rawValue)
    }
    
    public required convenience init?(coder: NSCoder) {
        let decodedDuration: Int = coder.decodeInteger(forKey: keys.duration.rawValue)
        
        self.init(duration: decodedDuration)
    }
    
    enum keys: String {
        case duration = "duration"
    }
    
    var duration: Int
    
    public init(duration: Int) {
        self.duration = duration
    }
    
    var displayName: String {
        get { return "Rest" }
    }
    
    var displayDescription: String? {
        get { return nil }
    }
}
