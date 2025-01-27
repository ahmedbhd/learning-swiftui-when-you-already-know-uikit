//
//  TodoToggleButton.swift
//  StateManagement
//
//  Created by Vincent on 13/04/2023.
//

import SwiftUI

struct TodoToggleButton: View {
    
    @Binding var state: Bool
    
    var body: some View {
        
        Button {
            withAnimation {
                state.toggle()
            }
        } label: {
            GeometryReader { proxy in
                ZStack {
                    Circle()
                        .stroke(lineWidth: 2.0)
                        .foregroundColor(.blue)
                    
                    if state {
                        Circle()
                            .frame(width: proxy.size.width * 0.8)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .frame(width: 40, height: 40)
    }
}

#Preview {
    StatefulPreviewWrapper(true) { state in
        TodoToggleButton(state: state)
        //                .previewLayout(.fixed(width: 100, height: 100))
    }
}
