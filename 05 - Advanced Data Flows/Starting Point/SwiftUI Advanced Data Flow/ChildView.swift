//
//  ChildView.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Anypli M1 Air on 21/11/2023.
//

import SwiftUI

struct ChildView: View {
    @State var text: String = ""
    
    var body: some View {
        Form {
            TextField("Write something", text: $text)
        }
        .textFieldInput(text)
    }
}

#Preview {
    ChildView()
}
