//
//  ACItemsListingView.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 23/2/23.
//

import SwiftUI
import CoreData
import FunnelConnectSDK

struct ACItemsListingView: View{
    
    @EnvironmentObject var store: Store
    var listItems: [Item]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(listItems) { item in
                        NavigationLink(destination: ItemDetail(item: item)) {
                            ItemRow(item: item)
                        }
                    }
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarItems(leading: TitleView(title: "Suggested Items"))
                .navigationBarColor(backgroundColor: .white, titleColor: .black)
            }
            .onAppear(perform: {
                TrackUtils.impression(value: "abandoned_cart_view")
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemsListingView(nil)
//                    .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
