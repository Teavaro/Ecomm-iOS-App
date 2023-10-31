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
    private let shopKeyCampaign = "708f47c5-e22d-457b-9d34-4cd35a160acb"
    private let cashewsKeyCampaign = "27e0048f-1200-44be-b3e1-fed6eecd437a"
    private let acKeyCampaign = "cf0d9bc0-cf5e-4687-b5d2-c75d0ddc8245"
    private let identClickKeyCampaign = "47399c46-d27c-4679-97b8-70e0bc5dc91d"
    
    private func send(url: String, params: String){
        HttpRequest().request(url: url, params: params, method: "POST")
    }
    
    func sendShop(user: String){
        send(url: url, params: "push_key=\(shopKeyCampaign)&user=\(user)")
    }
    
    func sendCashews(user: String){
        let data = """
        {"item_id":"5"}
        """
        send(url: url, params: "push_key=\(cashewsKeyCampaign)&user=\(user)&data_template=\(data)")
    }
    
    func sendAbandonedCart(user: String, abCart: Int){
        let data = """
        {"ab_cart_id":"\(abCart)"}
        """
        send(url: url, params: "push_key=\(acKeyCampaign)&user=\(user)&data_template=\(data)")
    }
    
    func sendIdentClick(user: String, userId: String, userType: String){
        let data = """
        {"userr_id":"\(userId)"}
        """
        send(url: url, params: "push_key=\(identClickKeyCampaign)&user=\(user)&data_template=\(data)")
    }
}

