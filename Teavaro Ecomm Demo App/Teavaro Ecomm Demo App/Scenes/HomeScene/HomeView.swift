//
//  HomeView.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 22/06/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var store: Store
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        VStack(alignment: .leading) {
//            Image(uiImage: UIImage(imageLiteralResourceName: "logo-angro"))
//                .padding()
            TabView(selection: $store.tabSelection) {
                AngroView(coordinator: Coordinator(store: store))
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(1)
                ItemsListingView()
                    .tabItem {
                        Label("Shop", systemImage: "bag")
                    }
                    .tag(2)
                WishlistView()
                    .tabItem {
                        Label("Wishlist", systemImage: "heart")
                    }
                    .tag(3)
                CheckoutView()
                    .tabItem {
                        Label("Cart", systemImage: "cart")
                    }
                    .tag(4)
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                    .tag(5)
            }
        }
        .onChange(of: scenePhase) { newPhase in
            TrackUtils.lifeCycle(phase: newPhase)
            if newPhase == .active {
                if let section = AppState.shared.section{
                    if(section == "store"){
                        store.tabSelection = 2
                    }
                    if(section == "store"){
                        store.tabSelection = 2
                    }
                    AppState.shared.section = nil
                }
            }
        }
        .onOpenURL { url in
            guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
                return
            }
            store.handleDeepLink(components: components)
        }
        .sheet(isPresented: $store.showAbandonedCarts, onDismiss: {
            print(store.showAbandonedCarts)
        }) {
            ModalAbandonedCarts(showAbandonedCarts: $store.showAbandonedCarts, listItems: DataManager.shared.getAbandonedCartItems(itemId: store.abandonedCartId))
        }
    }
        
}

struct ModalAbandonedCarts: View {
    @Environment(\.presentationMode) var presentation
    @Binding var showAbandonedCarts: Bool
    var listItems: [Item]

    var body: some View {
        VStack {
            ACItemsListingView(listItems: listItems)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(Order())
    }
}
