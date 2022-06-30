//
//  AppMain.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 21/06/2022.
//

import SwiftUI

@main
struct AppMain: App {

    @StateObject var order = Order()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(order)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
