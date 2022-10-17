//
//  CreateExerciseViewModel.swift
//  timer
//
//  Created by Anderson David on 10/17/22.
//

import Foundation
import CoreData

public class CreateExerciseViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var desc: String? = nil
    @Published var defaultDuration: Int = 60
    
    static func addNewExercise(exercise: CreateExerciseViewModel, moc: NSManagedObjectContext) {
        let newExercise = Exercise(context: moc)
        newExercise.name = exercise.name
        newExercise.desc = exercise.desc
        newExercise.defaultDuration = Int64(exercise.defaultDuration)
        newExercise.creationDate = Date()
        
        do {
            try moc.save()
        } catch(let error) {
            print("Error saving exercise: \(error.localizedDescription)")
        }
    }
}
