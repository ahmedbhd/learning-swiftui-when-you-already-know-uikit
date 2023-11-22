//
//  ContentView.swift
//  AnimationsAndTransitions
//
//  Created by Vincent on 11/05/2023.
//

import SwiftUI

struct ScalingButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.headline)
            .animation(nil, value: configuration.isPressed) // .animation(nil, value: ) => removes animation for the above modifiers
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)

    }
    
}

struct ContentView: View {
    
    @State var showImage = false
    var body: some View {
        VStack {
            Button(showImage ? "Make the Image disappear!" : "Make an Image appear!") {
                withAnimation { // Animate everything influenced by this change
                    showImage.toggle()
                }
            }
//            .onTapGesture {
//
//            }
            .buttonStyle(ScalingButtonStyle())
            
            if showImage {
                Image("pikachu")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .transition(.fly)
//                    .transition(.slide.combined(with: .opacity))
//                    .transition(.asymmetric(
//                        insertion: .opacity, 
//                        removal: .slide.combined(with: .opacity))
//                    )
            } else {
                Spacer()
                    .frame(height: 200)
            }
        }
    }
}

#Preview {
    ContentView()
}
