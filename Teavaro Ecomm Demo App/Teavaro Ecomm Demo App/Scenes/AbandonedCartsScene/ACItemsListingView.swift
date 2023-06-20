//
//  ACItemsListingView.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 23/2/23.
//

import SwiftUI
import CoreData

struct ACItemsListingView: View{
    
    @EnvironmentObject var store: Store
    var listItems: [Item]
    
    fileprivate func insertButton(title: String, action: @escaping() -> Void) -> some View {
        return Button {
            action()
        } label: {
            Text(title)
                .bold()
                .foregroundColor(.white)
        }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .frame(maxWidth: .infinity, alignment: .center)
            .background(.cyan)
            .cornerRadius(5)
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(listItems) { item in
                        NavigationLink(destination: ItemDetail(item: item)) {
                            ItemRow(item: item)
                        }
                    }
                    insertButton(title: "Add to Cart", action: {
                        for item in listItems {
                            store.addItemToCart(item: item)
                        }
                        store.tabSelection = 4
                        store.showAbandonedCarts = false
                    })
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
