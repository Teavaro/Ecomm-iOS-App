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
    static let EVENT_NAME = "event_name"
    static let EVENT_DATA = "event_data"
    
    static func impression(value: String){
        var eventsMap = [EVENT_NAME: "navigation", EVENT_DATA: value]
        if(mtid != nil){
            eventsMap["mtid"] = mtid!
        }
        events(events: eventsMap)
    }
    
    static func click(value: String){
        var eventsMap = [EVENT_NAME: "click", EVENT_DATA: value]
        if(mtid != nil){
            eventsMap["mtid"] = mtid!
        }
        events(events: eventsMap)
    }
    
    static func events(events: [String: String]){
        if(FunnelConnectSDK.shared.isInitialize() && UserDefaultsUtils.isCdpNba()){
            try? FunnelConnectSDK.shared.logEvents(events: events)
        }
    }
    
    static func geoPlace(value: String){
        let eventsMap = [EVENT_NAME: "location", EVENT_DATA: value]
        events(events: eventsMap)
    }
    
    static func logEvent(key: String, value: String){
        if(FunnelConnectSDK.shared.isInitialize() && UserDefaultsUtils.isCdpNba()){
            if(mtid != nil){
                let eventsMap = [key: value, "mtid": mtid!]
                events(events: eventsMap)
            }
            else {
                try? FunnelConnectSDK.shared.logEvent(key: key, value: value)
            }
        }
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
