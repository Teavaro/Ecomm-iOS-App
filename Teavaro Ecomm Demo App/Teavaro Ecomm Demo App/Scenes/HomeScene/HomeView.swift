//
//  HomeView.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 22/06/2022.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
//            Image(uiImage: UIImage(imageLiteralResourceName: "logo-angro"))
//                .padding()
            TabView {
                ItemsListingView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                OrderView()
                    .tabItem {
                        Label("Cart", systemImage: "cart")
                    }
                ItemsListingView()
                    .tabItem {
                        Label("Wishlist", systemImage: "heart")
                    }
                AccountView()
                    .tabItem {
                        Label("Account", systemImage: "person.crop.circle")
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(Order())
    }
}
