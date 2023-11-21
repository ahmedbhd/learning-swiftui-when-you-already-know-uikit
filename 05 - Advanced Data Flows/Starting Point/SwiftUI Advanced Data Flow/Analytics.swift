//
//  Analytics.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Anypli M1 Air on 21/11/2023.
//

import Foundation

class Analytics {
    
    func send(tag: String) {
        print("TAG \(tag) was send!")
    }
}

class MockAnalytics: Analytics {
    
    override func send(tag: String) {
        print("Overriden method")
    }
}
