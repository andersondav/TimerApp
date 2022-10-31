//
//  CreateRoutineView.swift
//  timer
//
//  Created by Anderson David on 8/27/22.
//

import SwiftUI

struct CreateRoutineView: View {
    @StateObject var createRoutineViewModel: CreateRoutineViewModel = CreateRoutineViewModel()
    
    @State var isTitleChosen = false
    @State var displayErrorMsg = false
    
    @Binding var creatingRoutine: Bool
    
    var body: some View {
        EnterTitleView(nameBinding: $createRoutineViewModel.name, errorMsg: "Please enter a routine name", titleText: "Give your routine a name!", placeholder: "Routine name", displayErrorMsg: $displayErrorMsg)
            .navigationTitle("New Routine")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem() {
                    Button("Next") {
                        if createRoutineViewModel.name.count > 0 {
                            isTitleChosen.toggle()
                        }
                        else {
                            displayErrorMsg = true
                        }
                    }
                }
            }
        
        NavigationLink(destination: CreateRoutineDescView(createRoutineViewModel: createRoutineViewModel, creatingRoutine: $creatingRoutine), isActive: $isTitleChosen) {
            EmptyView()
        }
    }
}

struct CreateRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRoutineView(creatingRoutine: Binding.constant(true))
    }
}
