//
//  TrackUtils.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 2/3/23.
//

import Foundation
import funnelConnectSDK
import utiqSDK
import SwiftUI

class TrackUtils {
    
    static var mtid: String? = nil
    static let IMPRESSION = "impression"
    static let CLICK = "click"
    static let ABANDONED_CART_ID = "abandoned_cart_id"
    static let GEO_PLACE = "geo_place"
    
    static func impression(value: String){
        logEvent(key: IMPRESSION, value: value)
    }
    
    static func click(value: String){
        logEvent(key: CLICK, value: value)
    }
    
    static func events(events: [String: String]){
        if(FunnelConnectSDK.shared.isInitialize()){
            try? FunnelConnectSDK.shared.logEvents(events: events)
        }
    }
    
    static func geoPlace(value: String){
        logEvent(key: GEO_PLACE, value: value)
    }
    
    static func logEvent(key: String, value: String){
//        if(FunnelConnectSDK.shared.isInitialize()){
//            if(mtid != nil){
//                let eventsMap = [key: value, "mtid": mtid!]
//                events(events: eventsMap)
//            }
//            else {
//                try? FunnelConnectSDK.shared.logEvent(key: key, value: value)
//            }
//        }
    }
    
    static func lifeCycle(phase: ScenePhase){
        if phase == .active {
            impression(value: "active_scene")
        } else if phase == .inactive {
            impression(value: "inactive_scene")
        } else if phase == .background {
            impression(value: "background_scene")
        }
    }
}
