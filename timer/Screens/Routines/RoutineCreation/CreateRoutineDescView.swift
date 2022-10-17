//
//  CreateRoutineDescView.swift
//  timer
//
//  Created by Anderson David on 9/12/22.
//

import SwiftUI

struct CreateRoutineDescView: View {
    @ObservedObject var createRoutineViewModel: CreateRoutineViewModel
    
    var body: some View {
        EnterDescView(descBinding: $createRoutineViewModel.desc)
        .navigationTitle(createRoutineViewModel.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem() {
                NavigationLink {
                    CreateRoutineExerciseView(createRoutineViewModel: createRoutineViewModel)
                } label: {
                    Text("Next")
                }
            }
        }
    }
}

struct CreateRoutineDescView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRoutineDescView(createRoutineViewModel: CreateRoutineViewModel())
    }
}
