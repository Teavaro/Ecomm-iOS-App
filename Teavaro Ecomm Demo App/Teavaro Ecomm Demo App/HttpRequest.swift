//
//  HttlRequest.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 9/12/22.
//

import Foundation
import SwiftUI

class HttpRequest {
    
    func request(fromURLString urlString: String) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                
            }
            urlSession.resume()
        }
    }
}
