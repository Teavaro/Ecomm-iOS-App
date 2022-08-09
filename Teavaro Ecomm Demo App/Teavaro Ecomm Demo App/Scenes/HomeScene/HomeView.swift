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
                AngroView()
                    .tabItem {
                        Label("Angro", systemImage: "house")
                    }
                ItemsListingView()
                    .tabItem {
                        Label("Shop", systemImage: "bag")
                    }
                WishlistView()
                    .tabItem {
                        Label("Wishlist", systemImage: "heart")
                    }
                CheckoutView()
                    .tabItem {
                        Label("Cart", systemImage: "cart")
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
