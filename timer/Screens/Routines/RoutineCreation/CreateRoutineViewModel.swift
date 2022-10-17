//
//  CreateRoutineViewModel.swift
//  timer
//
//  Created by Anderson David on 9/12/22.
//

import Foundation

public class CreateRoutineViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var desc: String? = nil
    @Published var descPlaceholder: String = "Optionally, enter a description for this routine"
    
    @Published var restEnabled: Bool = true
    @Published var restLength: Int = 30
    
    @Published var defaultExerciseLengthEnabled: Bool = true // TODO: switch this to retrieve ETO val from settings
    @Published var defaultExerciseLength: Int = 60
    
    @Published var events: [Event] = []
}
