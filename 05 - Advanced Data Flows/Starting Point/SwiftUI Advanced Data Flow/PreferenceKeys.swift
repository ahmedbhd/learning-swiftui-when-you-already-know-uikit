//
//  PreferenceKeys.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Anypli M1 Air on 21/11/2023.
//

import Foundation
import SwiftUI

struct TextFieldInputPreferenceKey: PreferenceKey {
    static let defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

extension View {
    func textFieldInput(_ textInput: String) -> some View {
        self.preference(key: TextFieldInputPreferenceKey.self, value: textInput)
    }
}
