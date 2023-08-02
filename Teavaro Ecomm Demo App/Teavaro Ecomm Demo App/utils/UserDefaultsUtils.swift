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
    private static let IS_LOGIN = "IS_LOGIN"
    private static let MTID = "MTID"
    private static let USER_NAME = "USER_NAME"
    private static let USER_ID = "USER_ID"
    
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
    
    static func getStubToken() -> String {
        return self.userDefaults.string(forKey: IS_STUB) ?? ""
    }
    
    static func setStubToken(value: String) {
        self.userDefaults.set(value, forKey: IS_STUB)
    }
    
    static func isLogin() -> Bool {
        return self.userDefaults.bool(forKey: IS_LOGIN)
    }
    
    static func setLogin(value: Bool) {
        self.userDefaults.set(value, forKey: IS_LOGIN)
    }
    
    static func getUserName() -> String? {
        return self.userDefaults.string(forKey: USER_NAME)
    }
    
    static func setUserName(value: String) {
        self.userDefaults.set(value, forKey: USER_NAME)
    }
    
    static func getUserId() -> String? {
        return self.userDefaults.string(forKey: USER_ID)
    }
    
    static func setUserId(value: String) {
        self.userDefaults.set(value, forKey: USER_ID)
    }
    
    static func clear(){
        setLogin(value: false)
        setUserId(value: "")
        setUserName(value: "")
        setStubToken(value: "")
        setPermissionsRequested(value: false)
    }
}
