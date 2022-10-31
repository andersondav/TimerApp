//
//  CreateRoutineViewModel.swift
//  timer
//
//  Created by Anderson David on 9/12/22.
//

import Foundation
import OrderedCollections

public class CreateRoutineViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var desc: String? = nil
    @Published var descPlaceholder: String = "Optionally, enter a description for this routine"
    
    @Published var restEnabled: Bool = true
    @Published var restLength: Int = 30
    
    @Published var defaultExerciseLengthEnabled: Bool = true
    @Published var defaultExerciseLength: Int = 60
    
    @Published var events: [Event] = [Event]()
    
    func addExercises(selectedExercises: OrderedSet<Exercise>) {
        for e in selectedExercises {
            print(e)
            addExercise(e: e)
        }
        
        print(events)
    }
    
    func addExercise(e: Exercise) {
        let event = ExerciseEvent(context: DataController.moc)
        event.exercise = e
        event.displayName = e.name
        event.displayDesc = e.desc
        event.duration = defaultExerciseLengthEnabled ? Int64(defaultExerciseLength) : Int64(e.defaultDuration)
        
        if restEnabled && events.count > 0 {
            let rest = RestEvent(context: DataController.moc)
            rest.displayName = "Rest"
            rest.duration = Int64(restLength)
            events.append(rest)
            events.append(event)
        }
        else {
            events.append(event)
        }
    }
}
