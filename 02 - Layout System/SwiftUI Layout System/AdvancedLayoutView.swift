//
//  AdvancedLayoutView.swift
//  SwiftUI Layout System
//
//  Created by Vincent on 15/09/2021.
//

import SwiftUI

extension VerticalAlignment {
    enum AccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let accountAndName = VerticalAlignment(AccountAndName.self)
}

struct AdvancedLayoutView: View {
    var body: some View {
        HStack(alignment: .accountAndName) {
            VStack {
                Text("@v_pradeilles")
                    .alignmentGuide(.accountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                    .padding()
                    .background(.blue)
                
                Image("vincent")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .background(.yellow)
            }
            
            VStack {
                Text("full name:")
                    .background(.red)
                
                Text("Vincent Pradeilles")
                    .alignmentGuide(.accountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(.green)
            }
        }
    }
}

#Preview {
    AdvancedLayoutView()
}
