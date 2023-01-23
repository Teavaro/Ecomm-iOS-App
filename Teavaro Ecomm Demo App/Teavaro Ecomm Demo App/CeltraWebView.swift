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

    var configuration: WKWebViewConfiguration
    var javaScript: String
    
    let css = """
        html, body {
          overflow-x: hidden;
        }

        body {
          background-color: #333333;
          line-height: 1.5;
          color: white;
          padding: 10;
          font-weight: 600;
          font-family: -apple-system;
        }
    """
    
    let htmlContent = ""
    
    init(){
        let cssString = css.components(separatedBy: .newlines).joined()

        // Create JavaScript that loads the CSS
        javaScript = """
           var element = document.createElement('style');
           element.innerHTML = '\(cssString)';
           document.head.appendChild(element);
        """
        
        let userScript = WKUserScript(source: javaScript,
                                      injectionTime: .atDocumentEnd,
                                      forMainFrameOnly: true)
        // Set user script to a configuration object and load it into the webView
        let userContentController = WKUserContentController()
        userContentController.addUserScript(userScript)
        configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
    }

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(htmlContent, baseURL: nil)
    }
}
