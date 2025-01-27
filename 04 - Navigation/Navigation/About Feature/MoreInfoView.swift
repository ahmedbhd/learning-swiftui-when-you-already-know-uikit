//
//  MoreInfoView.swift
//  StateManagement
//
//  Created by Vincent on 20/04/2023.
//

import SwiftUI

struct MoreInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    MoreInfoView()
}
