//
//  HomeView.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 22/06/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var tabSelection = 1
    
    var body: some View {
        VStack(alignment: .leading) {
//            Image(uiImage: UIImage(imageLiteralResourceName: "logo-angro"))
//                .padding()
            TabView(selection: $tabSelection) {
                AngroView(tabSelection: $tabSelection)
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(Order())
    }
}
