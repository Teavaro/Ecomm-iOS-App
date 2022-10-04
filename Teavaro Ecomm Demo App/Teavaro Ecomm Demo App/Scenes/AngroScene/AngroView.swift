//
//  AngroView.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI
import CoreData
import FunnelConnectSDK

struct AngroView: View {
    
    @EnvironmentObject var store: Store
    @Binding var tabSelection: Int
    
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
    
    fileprivate func headerView() -> some View {
        return VStack(alignment: .center, spacing: 20){
            Text("B2B WooCommerce Theme")
                .font(.title2)
                .foregroundColor(.white)
            Text("Sale Up to 30%")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            insertButton(title: "Explore Fresh", action: {
                try? FunnelConnectSDK.shared.cdp().logEvent(key: "Button", value: "exploreFresh")
                tabSelection = 2
            })
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 400, maxHeight: 400, alignment: .center)
        .background(
            Image("bg_image")
                .resizable()
        )
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    headerView()
                    
                    Text("Best selling items:")
                        .font(.title)
                        .bold()
                        .padding(.top)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    
                    ForEach(store.listOffer) { item in
                        NavigationLink(destination: ItemDetail(item: item)) {
                            ItemRow(item: item)
                        }
                    }
                    
                    Image("bg_special_offer")
                        .resizable()
                        .padding(.top)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300, maxHeight: 300, alignment: .center)
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarItems(leading: TitleView(title: "Angro"))
                .navigationBarColor(backgroundColor: .white, titleColor: .black)
                .listStyle(.plain)
            }
            .onAppear(perform: {
                print("excecuting FunnelConnectSDK.startService()")
                try? FunnelConnectSDK.shared.cdp().startService(dataCallback: {_ in
                    if let umid = try? FunnelConnectSDK.shared.cdp().getUmid() {
                        print("excecuting SwrveSDK.start(withUserId: umid)")
                        SwrveSDK.start(withUserId: umid)
                    }
                }, errorCallback_: {_ in
                    
                })
                try? FunnelConnectSDK.shared.cdp().logEvent(key: "Navigation", value: "home")
            })
        }
    }
}

struct AngroView_Previews: PreviewProvider {
    static var previews: some View {
        AngroView(tabSelection: .constant(1))
    }
}
