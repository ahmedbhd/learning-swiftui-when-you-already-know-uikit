//
//  ParentView.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Anypli M1 Air on 21/11/2023.
//

import SwiftUI

struct ParentView: View {
    
    @State var textInput: String = ""
    var body: some View {
        VStack {
            Text("This is what my child asked me to say: \(textInput)")
            
            ChildView()
        }
        .onPreferenceChange(TextFieldInputPreferenceKey.self) { value in
            textInput = value
        }
    }
}

#Preview {
    ParentView()
}
