//
//  UserDefaultsUtils.swift
//  iosApp
//
//  Created by Ahmad Mahmoud on 09/03/2022.
//

import Foundation

class UserDefaultsUtils {
    
    private static let CDP_CONSENT = "CDP_CONSENT"
    private static let CDP_OM = "CDP_OM"
    private static let CDP_OPT = "CDP_OPT"
    private static let CDP_NBA = "CDP_NBA"
    private static let PERMISSIONS_REQUESTED = "PERMISSIONS_REQUESTED"
    private static let userDefaults = UserDefaults.standard
    private static let IS_STUB = "IS_STUB"
    
    static func isCdpConsentAccepted() -> Bool {
        return self.userDefaults.bool(forKey: CDP_CONSENT)
    }
    
    static func acceptCdpConsent() {
        self.userDefaults.set(true, forKey: CDP_CONSENT)
    }
    
    static func rejectCdpConsent() {
        self.userDefaults.set(false, forKey: CDP_CONSENT)
    }
    
    static func isCdpOm() -> Bool {
        return self.userDefaults.bool(forKey: CDP_OM)
    }
    
    static func setCdpOm(om: Bool) {
        self.userDefaults.set(om, forKey: CDP_OM)
    }
    
    static func isCdpOpt() -> Bool {
        return self.userDefaults.bool(forKey: CDP_OPT)
    }
    
    static func setCdpOpt(opt: Bool) {
        self.userDefaults.set(opt, forKey: CDP_OPT)
    }
    
    static func isCdpNba() -> Bool {
        return self.userDefaults.bool(forKey: CDP_NBA)
    }
    
    static func setCdpNba(nba: Bool) {
        self.userDefaults.set(nba, forKey: CDP_NBA)
    }
    
    static func isPermissionsRequested() -> Bool {
        return self.userDefaults.bool(forKey: PERMISSIONS_REQUESTED)
    }
    
    static func setPermissionsRequested(value: Bool) {
        self.userDefaults.set(value, forKey: PERMISSIONS_REQUESTED)
    }
    
    static func isStub() -> Bool {
        return self.userDefaults.bool(forKey: IS_STUB)
    }
    
    static func setStub(value: Bool) {
        self.userDefaults.set(value, forKey: IS_STUB)
    }
}
