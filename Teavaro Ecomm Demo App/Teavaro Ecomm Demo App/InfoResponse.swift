//
//  InfoResponse.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 20/1/23.
//

import Foundation

struct KVString: Codable{
    let key: String
    let value: String
}

struct InfoResponse: Codable {
    let umid: String
    let state: Int
    let permissions: Dictionary<String, Bool>
    let permissionsLastModification: Dictionary<String, String>
//    let notificationHistory: [Dictionary<String, String>]
    let notificationStatus: Dictionary<String, Bool>
    let attributes: Dictionary<String, String>
}
