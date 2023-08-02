//
//  HttlRequest.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 9/12/22.
//

import Foundation
import SwiftUI

class HttpRequest {
    func request(url: String, params: String, method: String) {
        DispatchQueue.main.async {
            if let serviceUrl = URL(string: url){
                var request = URLRequest(url: serviceUrl)
                request.httpMethod = method
                request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = params.data(using: String.Encoding.utf8)
                let session = URLSession.shared
                session.dataTask(with: request) { (data, response, error) in
//                    print("response: \(response), error: \(error)")
                }.resume()
            }
        }
    }
}
