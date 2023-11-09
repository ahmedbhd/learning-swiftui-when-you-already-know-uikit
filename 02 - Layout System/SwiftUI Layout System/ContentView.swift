//
//  ContentView.swift
//  SwiftUI Layout System
//
//  Created by Vincent on 23/08/2021.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("shouldDisplayAnimation")
    var shouldDisplayAnimation = true
    
    var body: some View {
        ScrollView {
            VStack {
                images
                
                VStack(alignment: .leading) {
                    Text("title")
                        .font(.headline)
                    
                    Text("subtitle")
                        .font(.subheadline)
                    
                    ratings
                    
                    Text("description")
                        .font(.body)
                }
            }
            .padding()
        }
    }
    
    private var images: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal) {
                HStack {
                    Image("cover")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 350)
                        .id("cover")
                    
                    ForEach(0 ..< 3) { item in
                        Image("image-\(item)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 350)
                            .id("image-\(item)")
                    }
                }
            }.onAppear {
                guard shouldDisplayAnimation else { return }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        proxy.scrollTo("image-0", anchor: .trailing)
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        withAnimation {
                            proxy.scrollTo("cover")
                            shouldDisplayAnimation = false
                        }
                    }
                }
            }
        }
    }
    
    private var ratings: some View {
        HStack(spacing: 0) {
            ForEach(0 ..< 5) { item in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

#Preview {
    ContentView()
        .onAppear {
            UserDefaults.standard.removeObject(forKey: "shouldDisplayAnimation")
        }
}
