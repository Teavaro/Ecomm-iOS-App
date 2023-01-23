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

    var htmlContent = ""

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(htmlContent, baseURL: nil)
    }
}


