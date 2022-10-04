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
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            print("excecuting FunnelConnectSDK.initialize()")
            FunnelConnectSDK.shared.initialize(sdkToken: "BXDX2QY]37Yo^LH}Y4oDmNo6", options:  FCOptions(enableLogging: true))
            
            DispatchQueue.main.async {
                let config = SwrveConfig()
                config.initMode = SWRVE_INIT_MODE_MANAGED
                print("excecuting SwrveSDK.sharedInstance()")
                SwrveSDK.sharedInstance(withAppID: 32153,
                    apiKey: "FiIpd4eZ8CtQ6carAAx9",
                    config: config)
                print("end SwrveSDK.sharedInstance()")
            }
          return true
        }
      }
}
