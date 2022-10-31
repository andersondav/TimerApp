//
//  ExerciseCell.swift
//  timer
//
//  Created by Anderson David on 10/28/22.
//

import SwiftUI
import UIKit

struct ExerciseCell: View {
    var exercise: Exercise
    
    var showDuration: Bool = false
    var showSelectable: Bool = false
    @State var selected: Bool = false
    
    var onTap: ((Exercise) -> Void)?
    
    var body: some View {
        HStack {
            if showSelectable {
                CheckboxView(checked: $selected)
            }
            Text(exercise.name ?? "")
            Spacer()
            if showDuration {
                Text("\(String(exercise.defaultDuration))s")
            }
        }.onTapGesture {
            selected.toggle()
            if let handler = onTap {
                handler(exercise)
            }
        }
    }
}

struct ExerciseCell_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCell(exercise: Exercise.example, showDuration: true, showSelectable: true, onTap: { e in
            print("tapped")
        }).previewLayout(.sizeThatFits)
    }
}
