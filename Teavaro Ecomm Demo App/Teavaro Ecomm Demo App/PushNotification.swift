//
//  PushNotification.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 9/12/22.
//

import Foundation
import SwiftUI

class PushNotification {
    
    private let url = "https://service.swrve.com/push"
    private let swrveKeyCampaign = "708f47c5-e22d-457b-9d34-4cd35a160acb"
    
    func send(user: String, message: String){
        let newUrl = url+"?push_key="+swrveKeyCampaign+"&user="+user+"&message="+message
        HttpRequest().request(urlString: newUrl)
    }
}

