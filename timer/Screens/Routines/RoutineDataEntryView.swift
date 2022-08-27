//
//  RoutineDataEntryView.swift
//  timer
//
//  Created by Anderson David on 8/27/22.
//

import SwiftUI

struct RoutineDataEntryView: View {
    @ObservedObject var newRoutine: NewRoutineData

    var body: some View {
        VStack {
            TextField("Routine name", text: $newRoutine.name)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            TextEditor(text: $newRoutine.descPlaceholder)
                .frame(height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                .background(Color.gray)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .textFieldStyle(.roundedBorder)
                .onAppear {
                    UITextView.appearance().backgroundColor = .clear
                }
                
        }
    }
}

struct RoutineDataEntryView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineDataEntryView(newRoutine: NewRoutineData())
    }
}
