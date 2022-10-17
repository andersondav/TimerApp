//
//  CreateExerciseDescAndLengthView.swift
//  timer
//
//  Created by Anderson David on 10/17/22.
//

import SwiftUI

struct CreateExerciseDescAndLengthView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @ObservedObject var createExerciseViewModel: CreateExerciseViewModel
    
    @State var presentLengthAlert: Bool = false
    
    @Binding var creatingExercise: Bool
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                EnterDescView(descBinding: $createExerciseViewModel.desc)
                    .frame(height: metrics.size.height * 0.5)
                HStack {
                    Group {
                        Text("Default exercise duration:")
                        TextField("Exercise duration", value: $createExerciseViewModel.defaultDuration, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 50)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                        Text("s")
                    }
                    Button {
                        presentLengthAlert = true
                    } label: {
                        Image(systemName: "questionmark")
                            .imageScale(.small)
                    }
                }
                .font(.body)
                Spacer()
            }
        }
        .navigationTitle(createExerciseViewModel.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem() {
                Button(action: { CreateExerciseViewModel.addNewExercise(exercise: createExerciseViewModel, moc: moc); creatingExercise = false }, label: {
                    Text("Finish")
                })
            }
        }
        
    }
}

struct CreateExerciseDescAndLengthView_Previews: PreviewProvider {
    static var previews: some View {
        CreateExerciseDescAndLengthView(createExerciseViewModel: CreateExerciseViewModel(), creatingExercise: .constant(true))
    }
}
