//
//  TrackUtils.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 2/3/23.
//

import Foundation
import FunnelConnect
import UTIQ
import SwiftUI

class TrackUtils {
    
    static var mtid: String? = nil
    static let EVENT_NAME = "event_name"
    static let EVENT_DATA = "event_data"
    
    static func impression(value: String){
        event(value: value, name: "navigation")
    }
    
    static func click(value: String){
        event(value: value, name: "click")
    }
    
    static func event(value: String, name: String){
        var eventsMap = [EVENT_NAME: name, EVENT_DATA: value]
        if(mtid != nil){
            eventsMap["mtid"] = mtid!
        }
        events(events: eventsMap)
    }
    
    static func events(events: [String: String]){
        if(FunnelConnectSDK.shared.isInitialize() && UserDefaultsUtils.isCdpOpt()){
            try? FunnelConnectSDK.shared.logEvents(events: events)
        }
    }
    
    static func geoPlace(value: String){
        event(value: value, name: "location")
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
