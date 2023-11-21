//
//  SyncingView.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Anypli M1 Air on 21/11/2023.
//

import SwiftUI

struct SyncViewProxy {
    fileprivate var maxWidth: CGFloat?
}

struct SyncingView<Content: View>: View {
    @State var proxy = SyncViewProxy()
    
    @ViewBuilder var content: (SyncViewProxy) -> Content
    
    var body: some View {
        VStack {
            content(proxy)
        }
        .onPreferenceChange(MaxWidthPreferenceKey.self) { newValue in
            proxy.maxWidth = newValue
        }
    }
}

struct SyncingWidthModifier: ViewModifier {
    var proxy: SyncViewProxy
    
    func body(content: Content) -> some View {
        content
            .frame(width: proxy.maxWidth)
            .background {
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: MaxWidthPreferenceKey.self,
                                    value: proxy.size.width)
                }
            }
    }
}

extension View {
    func syncWidth(using proxy: SyncViewProxy) -> some View {
        self.modifier(SyncingWidthModifier(proxy: proxy))
    }
}
