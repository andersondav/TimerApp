//
//  EnterTitleView.swift
//  timer
//
//  Created by Anderson David on 10/17/22.
//

import SwiftUI

struct EnterTitleView: View {
    @Binding var nameBinding: String
    
    var errorMsg: String
    var titleText: String
    var placeholder: String
    
    @Binding var displayErrorMsg: Bool
    
    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            TextField(placeholder, text: $nameBinding)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            if displayErrorMsg {
                Text(errorMsg)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct EnterTitleView_Previews: PreviewProvider {
    static var previews: some View {
        EnterTitleView(nameBinding: .constant(""), errorMsg: "Error", titleText: "Some title", placeholder: "placeholder", displayErrorMsg: .constant(true))
    }
}
