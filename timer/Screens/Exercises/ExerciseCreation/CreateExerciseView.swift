//
//  CreateExerciseView.swift
//  timer
//
//  Created by Anderson David on 10/17/22.
//

import SwiftUI

struct CreateExerciseView: View {
    @StateObject var createExerciseViewModel: CreateExerciseViewModel = CreateExerciseViewModel()
    
    @State var displayErrorMsg = false
    
    @State var isTitleChosen = false
    
    @Binding var creatingExercise: Bool
    
    var body: some View {
        EnterTitleView(nameBinding: $createExerciseViewModel.name, errorMsg: "Please enter an exercise name.", titleText: "Give your exercise a name!", placeholder: "Push-ups", displayErrorMsg: $displayErrorMsg)
            .navigationTitle("New Exercise")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem() {
                    Button("Next") {
                        if createExerciseViewModel.name.count > 0 {
                            isTitleChosen.toggle()
                        }
                        else {
                            displayErrorMsg = true
                        }
                    }
                }
            }
        
        NavigationLink(destination: CreateExerciseDescAndLengthView(createExerciseViewModel: createExerciseViewModel, creatingExercise: $creatingExercise), isActive: $isTitleChosen) {
            EmptyView()
        }.isDetailLink(false)
    }
}

struct CreateExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        CreateExerciseView(creatingExercise: .constant(true))
    }
}
