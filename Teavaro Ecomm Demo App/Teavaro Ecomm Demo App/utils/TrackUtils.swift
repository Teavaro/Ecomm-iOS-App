//
//  TrackUtils.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 2/3/23.
//

import Foundation
import FunnelConnectSDK
import SwiftUI

class TrackUtils {
    
    static let IMPRESSION = "impression"
    static let CLICK = "click"
    static let ABANDONED_CART_ID = "abandoned_cart_id"
    static let GEO_PLACE = "geo_place"
    
    static func impression(value: String){
        try? FunnelConnectSDK.shared.cdp().logEvent(key: IMPRESSION, value: value)
    }
    
    static func click(value: String){
        try? FunnelConnectSDK.shared.cdp().logEvent(key: CLICK, value: value)
    }
    
    static func events(events: [String: String]){
        try? FunnelConnectSDK.shared.cdp().logEvents(events: events)
    }
    
    static func geoPlace(value: String){
        try? FunnelConnectSDK.shared.cdp().logEvent(key: GEO_PLACE, value: value)
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
