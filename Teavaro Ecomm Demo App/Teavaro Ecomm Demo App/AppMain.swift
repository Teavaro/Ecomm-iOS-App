//
//  AppMain.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 21/06/2022.
//

import SwiftUI
import FunnelConnect
import UTIQ
//import SwrveSDK
//import SwrveGeoSDK
import Pulse
import PulseUI
import PulseLogHandler
import Logging

@main
struct AppMain: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @StateObject var store = Store()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        return WindowGroup {
            HomeView()
                .environmentObject(store)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
    init() {
            
        }
    
    class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate{//SwrvePushResponseDelegate, SwrveGeofenceTransitionDelegate{
        let NotificationCategoryIdentifier = "com.swrve.sampleAppButtons"
        let NotificationActionOneIdentifier = "ACTION1"
        let NotificationActionTwoIdentifier = "ACTION2"
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
           self.initHttpRequestsMonitor()
            
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
            
            print("excecuting FunnelConnectSDK.initialize()")
            let fcConfigs = Bundle.main.path(forResource: "fc_configs", ofType: "json")!
            let options = FCOptions().enableLogging().setFallBackConfigJson(json: fcConfigs)
            FunnelConnectSDK.shared.initialize(sdkToken: "ko8G.Rv_vT97LiDuoBHbhBJt", options:  options)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                print("excecuting UTIQ.initialize()")
                let utiqConfigs = Bundle.main.url(forResource: "utiq_configs", withExtension: "json")!
                let fileContents = try? String(contentsOf: utiqConfigs)
                print(fileContents!)
                let options = UTIQOptions()
                options.enableLogging()
                options.setFallBackConfigJson(json: fileContents!)
                UTIQ.shared.initialize(sdkToken: "R&Ai^v>TfqCz4Y^HH2?3uk8j", options:  options)
            }
            
            //DispatchQueue.main.async {
                //let config = SwrveConfig()
                //config.pushResponseDelegate = self
                //config.pushEnabled = true
                //config.initMode = SWRVE_INIT_MODE_MANAGED
                //config.pushNotificationEvents = Set(["full_permission_button_clicked"])
                //config.provisionalPushNotificationEvents = Set(["Swrve.session.start"])
                //config.notificationCategories = self.produceUNNotificationCategory() as! Set<UNNotificationCategory>
                //print("excecuting SwrveSDK.sharedInstance()")
                //SwrveSDK.sharedInstance(withAppID: 32153,
                //    apiKey: "FiIpd4eZ8CtQ6carAAx9",
                //    config: config)
            //}
            print("end SwrveSDK.sharedInstance()")
            //let geoConfig = SwrveGeoConfig()
            //geoConfig.swrveGeofenceTransitionDelegate = self
            //SwrveGeoSDK.initWith(geoConfig)
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
        
//        func triggered(_ name: String, transition: String, at location: CLLocation, customProperties: String?) {
//            TrackUtils.geoPlace(value: name)
//        }
        
        private func initHttpRequestsMonitor() {
            LoggingSystem.bootstrap(PersistentLogHandler.init)
            URLSessionProxyDelegate.enableAutomaticRegistration()
        }
      }
}

class AppState: ObservableObject {
    static let shared = AppState()
    @Published var section : String?
}
