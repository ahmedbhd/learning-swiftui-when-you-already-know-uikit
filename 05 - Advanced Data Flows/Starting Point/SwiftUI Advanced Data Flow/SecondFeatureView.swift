//
//  SecondFeatureView.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Vincent on 04/09/2021.
//

import SwiftUI

struct SecondFeatureView: View {
    
    @Environment(\.analytics) var analytics: Analytics // Only use @Envirement inside a View
    
    var body: some View {
        Text("Feature n°2️⃣")
            .onAppear {
                analytics.send(tag: "Feature_01")
            }
    }
}

struct SecondFeature_Previews: PreviewProvider {
    static var previews: some View {
        SecondFeatureView()
    }
}
