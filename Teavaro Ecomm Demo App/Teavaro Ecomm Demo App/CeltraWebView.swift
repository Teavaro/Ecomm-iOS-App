//
//  CeltraConfig.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 20/1/23.
//

import Foundation
import SwiftUI
import WebKit

struct CeltraWebView: UIViewRepresentable {
    
    var banner: String
    var coordinator: Coordinator

    func makeUIView(context: Context) -> WKWebView {
        let userContentController = WKUserContentController()
        userContentController.add(coordinator, name: "bridge")

        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController

        let wkWebView = WKWebView(frame: .zero, configuration: configuration)
        wkWebView.navigationDelegate = coordinator
        return wkWebView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(banner, baseURL: nil)
    }
}

class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler{
    var webView: WKWebView?
    var store: Store?
    
    init(store: Store){
        self.store = store
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        self.webView = webView
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let store = self.store{
            store.processCelraAction(celtraResponse: message.body as! String)
        }
        print("iraniran: \(message.body)")
    }
}


