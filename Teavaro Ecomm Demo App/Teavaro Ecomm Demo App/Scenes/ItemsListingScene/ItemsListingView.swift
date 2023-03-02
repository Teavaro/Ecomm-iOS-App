//
//  ItemsListingView.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 21/06/2022.
//

import SwiftUI
import CoreData
import FunnelConnectSDK

struct ItemsListingView: View{
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                List {
                    ForEach(store.listItems) { item in
                        NavigationLink(destination: ItemDetail(item: item)) {
                            ItemRow(item: item)
                        }
                    }
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarItems(leading: TitleView(title: "Shop"))
                .navigationBarColor(backgroundColor: .white, titleColor: .black)
            }
            .onAppear(perform: {
                TrackUtils.impression(value: "shop_view")
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
