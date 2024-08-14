//
//  AppDelegate.swift
//  Ecomm-iOS-App
//
//  Created by Ahmad Mahmoud on 14/08/2024.
//

import UIKit
import UTIQ
import FunnelConnect
import Pulse

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
   
    let NotificationCategoryIdentifier = "com.swrve.sampleAppButtons"
    let NotificationActionOneIdentifier = "ACTION1"
    let NotificationActionTwoIdentifier = "ACTION2"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.initHttpRequestsMonitor()
        self.configurePushNotifications()
        self.initFunnelConnectSdk()
        self.initUtiqSdk()
        return true
    }
    
    func produceUNNotificationCategory() -> NSSet {

        let fgAction = UNNotificationAction(identifier: NotificationActionOneIdentifier, title: "Foreground", options: [UNNotificationActionOptions.foreground])

        let bgAction = UNNotificationAction(identifier: NotificationActionTwoIdentifier, title: "Background", options: [])

        let exampleCategory = UNNotificationCategory(identifier: NotificationCategoryIdentifier, actions: [fgAction, bgAction], intentIdentifiers: [], options: [])

        return NSSet(array:[exampleCategory])
    }
    
    func didReceive(_ response: UNNotificationResponse, withCompletionHandler completionHandler: (() -> Void)) {
        let userInfo = response.notification.request.content.userInfo
        if let infoNotification = userInfo["New Group 1"]{
            AppState.shared.section = (infoNotification as! [AnyHashable: Any])["section"]! as? String
        }
        completionHandler()
    }
    
    func willPresent(_ notification: UNNotification, withCompletionHandler completionHandler: ((UNNotificationPresentationOptions) -> Void)) {
        completionHandler([.banner, .list, .sound])
    }
    
    private func initHttpRequestsMonitor() {
        URLSessionProxyDelegate.enableAutomaticRegistration()
    }
    
    private func configurePushNotifications() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if error == nil {
                DispatchQueue.main.async {
                    print("DID REQUEST NOTIFICATIONS")
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
    
    private func initFunnelConnectSdk() {
        print("excecuting FunnelConnectSDK.initialize()")
        let fcConfigs = Bundle.main.path(forResource: "fc_configs", ofType: "json")!
        let options = FCOptions().enableLogging().setFallBackConfigJson(json: fcConfigs)
        FunnelConnectSDK.shared.initialize(sdkToken: "ko8G.Rv_vT97LiDuoBHbhBJt", options:  options)
    }
    
    private func initUtiqSdk() {
        print("excecuting UTIQ.initialize()")
        let utiqConfigs = Bundle.main.url(forResource: "utiq_configs", withExtension: "json")!
        let fileContents = try? String(contentsOf: utiqConfigs)
        print(fileContents!)
        let options = UTIQOptions()
        options.enableLogging()
        options.setFallBackConfigJson(json: fileContents!)
        UTIQ.shared.initialize(sdkToken: "R&Ai^v>TfqCz4Y^HH2?3uk8j", options:  options)
    }
  }
