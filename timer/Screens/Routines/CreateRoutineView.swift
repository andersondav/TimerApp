//
//  CreateRoutineView.swift
//  timer
//
//  Created by Anderson David on 8/27/22.
//

import SwiftUI

class NewRoutineData: ObservableObject {
    @Published var name: String = ""
    @Published var desc: String? = nil
    @Published var descPlaceholder: String = "Optionally, enter a description for this routine"
    
    @Published var restLength: Int? = 0
    @Published var defaultExerciseLength: Int? = 0
    
    @Published var events: [Event] = []
}

struct CreateRoutineView: View {
    @StateObject var newRoutineData: NewRoutineData = NewRoutineData()
    
    var body: some View {
        VStack {
            RoutineDataEntryView(newRoutine: newRoutineData)
                .padding(.horizontal)
            RoutineExerciseEntryView(newRoutine: newRoutineData)
                .padding(.horizontal)
        }
            .navigationTitle("New Routine")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct CreateRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRoutineView()
    }
}
