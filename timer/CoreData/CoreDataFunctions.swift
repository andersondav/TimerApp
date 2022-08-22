//
//  CoreDataFunctions.swift
//  timer
//
//  Created by Anderson David on 8/22/22.
//

import Foundation
import CoreData

class CoreDataFunctions {
    static func saveExercise(exercise: Exercise, moc: NSManagedObjectContext) {
        let exerciseModel = ExerciseModel(context: moc)
        exerciseModel.name = exercise.name
        exerciseModel.desc = exercise.desc
        exerciseModel.creationDate = exercise.creationDate
        
        do {
            try moc.save()
        } catch {
            print("Error saving exercise \(exercise.name) to CoreData")
        }
    }
    
    static func saveRoutine(routine: Routine, moc: NSManagedObjectContext) {
        let routineModel = RoutineModel(context: moc)
        routineModel.name = routine.name
        routineModel.desc = routine.desc
        routineModel.creationDate = routine.creationDate
        routineModel.restLength = Int64(routine.restLength ?? -1)
        routineModel.defaultExerciseDuration = Int64(routine.defaultExerciseDuration ?? -1)
        routineModel.events = Routine.convertEventsToData(events: routine.events)
        
        do {
            try moc.save()
        } catch {
            print("Error saving routine \(routine.name) to CoreData")
        }
    }
    
    static func loadExercise(exerciseModel: ExerciseModel) -> Exercise? {
        guard let creationDate = exerciseModel.creationDate, let name = exerciseModel.name else {
            print("Error loading exercise \(exerciseModel.name ?? "unknown")'s creation date/name")
            return nil
        }
        
        return Exercise(creationDate: creationDate, name: name, desc: exerciseModel.desc)
    }
    
    static func loadRoutine(routineModel: RoutineModel) -> Routine? {
        guard let creationDate = routineModel.creationDate, let name = routineModel.name, let eventsData = routineModel.events else {
            print("Error loading routine \(routineModel.name ?? "unknown")'s creation date/name/events")
            return nil
        }
        
        return Routine(creationDate: creationDate, name: name, desc: routineModel.desc, restLength: Int(routineModel.restLength), defaultExerciseDuration: Int(routineModel.defaultExerciseDuration), events: Routine.convertDataToEvents(data: eventsData))
    }
}
