//
//  ExerciseListView.swift
//  timer
//
//  Created by Anderson David on 8/27/22.
//

import SwiftUI

struct ExerciseListView: View {
    @Environment(\.managedObjectContext) var moc

    @FetchRequest(sortDescriptors: []) var exercises: FetchedResults<Exercise>
    
    @State var creatingExercise = false
    
    var body: some View {
        NavigationView {
            VStack {
                if exercises.count == 0 {
                    Text("Tap the + button to create a new exercise!")
                    Spacer()
                }
                else {
                    List(exercises) { exercise in
                        ExerciseCell(exercise: exercise, onTap: nil)
                    }
                }
            }
            .navigationTitle("Exercises")
            .toolbar {
                ToolbarItem() {
                    NavigationLink(isActive: $creatingExercise) {
                        CreateExerciseView(creatingExercise: $creatingExercise)
                    } label: {
                        Image(systemName: "plus")
                    }.isDetailLink(false)
                }
            }
        }
    }
}

struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView()
    }
}
