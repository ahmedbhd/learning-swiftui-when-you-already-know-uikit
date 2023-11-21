//
//  AboutView.swift
//  StateManagement
//
//  Created by Vincent on 20/04/2023.
//

import SwiftUI

struct AboutView: View {
    
    @State var isMoreInfoPresented = false
    
    var body: some View {
        VStack {
            Text("This app was made during\na SwiftUI course 👮👮")
                .multilineTextAlignment(.center)
                .padding()
            
            Button("More info?") {
                isMoreInfoPresented.toggle()
            }
        }
        .sheet(isPresented: $isMoreInfoPresented) {
            MoreInfoView()
                .presentationDetents([.medium, .large, .fraction(0.8)])
        }
    }
}

#Preview {
    AboutView()
}
