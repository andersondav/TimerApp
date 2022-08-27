//
//  RoutineExerciseEntryView.swift
//  timer
//
//  Created by Anderson David on 8/27/22.
//

import SwiftUI

struct RoutineExerciseEntryView: View {
    @ObservedObject var newRoutine: NewRoutineData
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RoutineExerciseEntryView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineExerciseEntryView(newRoutine: NewRoutineData())
    }
}
