//
//  EnterDescView.swift
//  timer
//
//  Created by Anderson David on 10/17/22.
//

import SwiftUI

struct EnterDescView: View {
    @Binding var descBinding: String?
    
    init(descBinding: Binding<String?>) {
        self._descBinding = descBinding
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            Text("Optionally, add a description")
                .font(.title)
                .multilineTextAlignment(.center)
            TextEditor(text: $descBinding.toNonOptional())
                .background(.teal)
                .frame(height: 200)
            Spacer()
        }
        .padding()
    }
}

struct EnterDescView_Previews: PreviewProvider {
    static var previews: some View {
        EnterDescView(descBinding: .constant(""))
    }
}
