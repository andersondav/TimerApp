//
//  EventCell.swift
//  timer
//
//  Created by Anderson David on 10/31/22.
//

import SwiftUI

struct EventCell: View {
    @Binding var event: Event
    
    @State var editable: Bool = true
    @FocusState var focusField: FocusField?
        
    var onChangeHandler: ((Event, Int) -> Void)? = nil
    
    var body: some View {
        HStack {
            Text(event.displayName ?? "")
            Spacer()
            if editable {
                TextField("0", value: $event.duration, format: .number)
                    .focused($focusField, equals: .editingEventLength(event: event))
                    .keyboardType(.numberPad).frame(width: 40)
                    .multilineTextAlignment(.trailing)
                    .textFieldStyle(.roundedBorder)
            }
            else {
                Text(String(event.duration))
            }
            Text("s")
        }
    }
}

struct EventCell_Previews: PreviewProvider {
    static var previews: some View {
        EventCell(event: Binding.constant(Event.example)) { event, newDuration in
            print(event.displayName)
        }
    }
}
