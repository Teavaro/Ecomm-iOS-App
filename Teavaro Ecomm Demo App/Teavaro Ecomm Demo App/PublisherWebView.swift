//
//  PublisherWebView.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 2/9/24.
//

import Foundation

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct WebViewContainer: View {
    let urlString: String

    var body: some View {
        if let url = URL(string: urlString) {
            WebView(url: url)
                .navigationBarTitle("Publisher", displayMode: .inline)
        } else {
            Text("Invalid URL")
        }
    }
}
