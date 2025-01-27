//
//  WebView.swift
//  UIKit_in_SwiftUI
//
//  Created by Vincent on 04/05/2023.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: URL
    var navigationPolicy: ((WKNavigationAction) -> WKNavigationActionPolicy)?
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.load(URLRequest(url: url))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(parent: WebView) {
            self.parent = parent
        }
        
        func webView(
            _ webView: WKWebView,
            decidePolicyFor navigationAction: WKNavigationAction,
            decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
        ) {
            decisionHandler(parent.navigationPolicy?(navigationAction) ?? .allow)
        }
    }
}

extension WebView {
    func set(navigationPolicy: @escaping (WKNavigationAction) -> WKNavigationActionPolicy) -> WebView {
        var copy = self // A patern to mutate a struct from a non mutatin method
        copy.navigationPolicy = navigationPolicy
        return copy
    }
}
