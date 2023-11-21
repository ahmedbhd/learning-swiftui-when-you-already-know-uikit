//
//  LoginView.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Anypli M1 Air on 21/11/2023.
//

import SwiftUI

struct LoginView: View {
        
    var body: some View {
        SyncingView { proxy in
            Group {
                Button("M'inscrire") {
                    
                }
                
                Button("Me connecter") {
                    
                }
            }
            .syncWidth(using: proxy)
            .padding()
            .background(Color.blue)
            .foregroundStyle(Color.white)
            .cornerRadius(15)
            .font(.headline)
        }
    }
}

#Preview {
    LoginView()
}
