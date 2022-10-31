//
//  CheckboxView.swift
//  timer
//
//  Created by Anderson David on 10/31/22.
//

import SwiftUI

struct CheckboxView: View {
    @Binding var checked: Bool
    
    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(.blue)
    }
}

struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView(checked: Binding.constant(true))
    }
}
