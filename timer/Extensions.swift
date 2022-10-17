//
//  Extensions.swift
//  timer
//
//  Created by Anderson David on 9/12/22.
//

import Foundation
import SwiftUI

extension Binding where Value == String? {
    func toNonOptional() -> Binding<String> {
        return Binding<String>{
            return self.wrappedValue ?? ""
        } set: { newValue, _ in
            self.wrappedValue = newValue
        }

    }
}
