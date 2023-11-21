//
//  FirstFeatureView.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Vincent on 04/09/2021.
//

import SwiftUI

struct FirstFeatureView: View {
    
//    @EnvironmentObject
    
    @Environment(\.analytics) var analytics: Analytics // Use this approach when you don't need to inject and ObservableObject
   
    var body: some View {
        Text("Feature n°1️⃣")
            .onAppear {
                analytics.send(tag: "Feature_01")
            }
    }
}

#Preview {
    FirstFeatureView()
}
