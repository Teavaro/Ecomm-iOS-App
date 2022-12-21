//
//  AppMain.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 21/06/2022.
//

import SwiftUI
import FunnelConnectSDK
import SwrveSDK

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
    
    class AppDelegate: NSObject, UIApplicationDelegate, SwrvePushResponseDelegate{
        let NotificationCategoryIdentifier = "com.swrve.sampleAppButtons"
        let NotificationActionOneIdentifier = "ACTION1"
        let NotificationActionTwoIdentifier = "ACTION2"
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            print("excecuting FunnelConnectSDK.initialize()")
//            BXDX2QY]37Yo^LH}Y4oDmNo6
            FunnelConnectSDK.shared.initialize(sdkToken: "R&Ai^v>TfqCz4Y^HH2?3uk8j", options:  FCOptions(enableLogging: true))
            
            DispatchQueue.main.async {
                let config = SwrveConfig()
                config.pushResponseDelegate = self
                config.pushEnabled = true
                config.initMode = SWRVE_INIT_MODE_MANAGED
                config.pushNotificationEvents = Set(["full_permission_button_clicked"])
                config.provisionalPushNotificationEvents = Set(["Swrve.session.start"])
                if #available(iOS 10.0, *) {
                    config.notificationCategories = self.produceUNNotificationCategory() as! Set<UNNotificationCategory>
                }
                print("excecuting SwrveSDK.sharedInstance()")
                SwrveSDK.sharedInstance(withAppID: 32153,
                    apiKey: "FiIpd4eZ8CtQ6carAAx9",
                    config: config)
                print("end SwrveSDK.sharedInstance()")
            }
          return true
        }
        
        @available(iOS 10.0, *)
        func produceUNNotificationCategory() -> NSSet {

            let fgAction = UNNotificationAction(identifier: NotificationActionOneIdentifier, title: "Foreground", options: [UNNotificationActionOptions.foreground])

            let bgAction = UNNotificationAction(identifier: NotificationActionTwoIdentifier, title: "Background", options: [])

            let exampleCategory = UNNotificationCategory(identifier: NotificationCategoryIdentifier, actions: [fgAction, bgAction], intentIdentifiers: [], options: [])

            return NSSet(array:[exampleCategory])
        }
        
        @available(iOS 10.0, *)
        func willPresent(_ notification: UNNotification!, withCompletionHandler completionHandler: ((UNNotificationPresentationOptions) -> Void)!) {
            // Called when a push is received when the app is in the foreground.
            completionHandler([.alert, .badge, .sound])
        }
      }
}
