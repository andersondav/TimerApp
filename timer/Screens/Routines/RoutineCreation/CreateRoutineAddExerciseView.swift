//
//  CreateRoutineAddExerciseView.swift
//  timer
//
//  Created by Anderson David on 10/28/22.
//

import SwiftUI
import OrderedCollections

struct CreateRoutineAddExerciseView: View {
    
    @ObservedObject var createRoutineViewModel: CreateRoutineViewModel
    
    @Binding var addingExercises: Bool

    @Environment(\.managedObjectContext) var moc

    @FetchRequest(sortDescriptors: []) var exercises: FetchedResults<Exercise>
    
    @State var selected = OrderedSet<Exercise>()
    
    func toggleExercise(e: Exercise) {
        if selected.contains(e) {
            selected.remove(e)
        }
        else {
            selected.append(e)
        }
    }
    
    var body: some View {
        VStack {
            if exercises.count == 0 {
                Group {
                    Text("No exercises found")
                    Spacer()
                }
            }
            else {
                VStack {
                    List {
                        Section(header: ListHeader()) {
                            ForEach(exercises, id: \.objectID) { exercise in
                                ExerciseCell(exercise: exercise, showDuration: true, showSelectable: true, onTap: { exercise in
                                    toggleExercise(e: exercise)
                                })
                            }
                        }
                    }
                    Button {
                        createRoutineViewModel.addExercises(selectedExercises: selected)
                        selected.removeAll()
                        addingExercises = false
                    } label: {
                        Text("Add")
                    }
                }
                
            }
        }
    }
}

struct ListHeader: View {
    var body: some View {
        HStack {
            Text("Exercise Name")
            Spacer()
            Text("Default Duration")
        }
    }
}

struct CreateRoutineAddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRoutineAddExerciseView(createRoutineViewModel: CreateRoutineViewModel(), addingExercises: Binding.constant(true))
    }
}
