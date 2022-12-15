//
//  HttlRequest.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 9/12/22.
//

import Foundation
import SwiftUI

class HttpRequest {
    func request(urlString: String) {
        if let serviceUrl = URL(string: urlString){
            print("iran: url good")
            var request = URLRequest(url: serviceUrl)
//            request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                print("iran: \(response)")
            }.resume()
        }
    }
}
