//
//  ItemsListingView.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 21/06/2022.
//

import SwiftUI
import CoreData

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
                    if(store.isLogin){
                        insertButton(title: "See more products", action: {
                            openURL(store.getClickIdentLink() ?? "")
                        })
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

fileprivate func openURL(_ urlString: String) {
    if let url = URL(string: urlString) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("Can't open URL: \(urlString)")
        }
    } else {
        print("Invalid URL: \(urlString)")
    }
}

fileprivate func insertButton(title: String, action: @escaping() -> Void) -> some View {
    return Button {
        action()
    } label: {
        Text(title)
            .bold()
            .foregroundColor(.white)
    }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        .frame(width: 300, height: 50, alignment: .center)
        .font(.title)
        .background(.cyan)
        .cornerRadius(5)
        .buttonStyle(PlainButtonStyle())
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemsListingView(nil)
//                    .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
