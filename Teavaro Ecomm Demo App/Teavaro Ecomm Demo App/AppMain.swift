//
//  AppMain.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 21/06/2022.
//

import SwiftUI
import FunnelConnectSDK

@main
struct AppMain: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    @StateObject var store = Store()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        try? FunnelConnectSDK.shared.cdp().startService()
        return WindowGroup {
            HomeView()
                .environmentObject(store)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FunnelConnectSDK.shared.initialize(sdkToken: "test123", options:  FCOptions(enableLogging: true))
          return true
        }
      }
}
