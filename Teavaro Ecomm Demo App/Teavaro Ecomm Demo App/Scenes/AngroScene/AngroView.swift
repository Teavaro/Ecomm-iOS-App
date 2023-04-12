//
//  AngroView.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI
import CoreData
import FunnelConnectSDK
import SwrveSDK
import Combine

struct AngroView: View {
    
    @EnvironmentObject var store: Store
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let buildVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    
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
                TrackUtils.click(value: "explore_fresh")
                store.tabSelection = 2
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
                    
                    CeltraWebView(store: store)
                        .frame(height: 120)
                    
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
                    
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarItems(leading: TitleView(title: "Home"))
                .navigationBarItems(trailing: Text("v\(appVersion ?? "")(\(buildVersion ?? ""))"))
                .navigationBarColor(backgroundColor: .white, titleColor: .black)
                .listStyle(.plain)
            }
            .onAppear(perform: {
                if(!store.isFunnelConnectStarted){
                    print("excecuting didInitializeWithResult")
                    FunnelConnectSDK.shared.didInitializeWithResult( success: {
                        DispatchQueue.main.async {
                            print("excecuting FunnelConnectSDK.trustpid.startService()")
                            if let isConsentAccepted = try? FunnelConnectSDK.shared.trustPid().isConsentAccepted(){
                                if(isConsentAccepted){
                                    try? FunnelConnectSDK.shared.trustPid().startService(dataCallback: {_ in

                                    }, errorCallback: {_ in
                                        print("error FunnelConnectSDK.trustpid.startService()")
                                    })
                                }
                            }
                            print("excecuting FunnelConnectSDK.cdp.startService()")
                            try? FunnelConnectSDK.shared.cdp().startService(notificationsName: "MAIN_CS", notificationsVersion: 1, dataCallback: { data in
                                if let umid = try? FunnelConnectSDK.shared.cdp().getUmid() {
                                    store.isCdpStarted.toggle()
                                    store.infoResponse = data
                                    if let permissions = try? FunnelConnectSDK.shared.cdp().getPermissions(), permissions.isEmpty() {
                                        store.showModal.toggle()
                                    }
                                    print("excecuting SwrveSDK.start(withUserId: \(umid)")
                                    SwrveSDK.start(withUserId: umid)
                                    store.isFunnelConnectStarted = true
                                }
                            }, errorCallback: {_ in
                                print("error FunnelConnectSDK.cdp.startService()")
                            })
                        }
                    }, failure: {_ in
                        print("error FunnelConnectSDK.shared.didInitializeWithResult")
                    })
                }
                TrackUtils.impression(value: "home_view")
            })
        }
        .sheet(isPresented: $store.showModal, onDismiss: {
            print(store.showModal)
        }) {
            ModalView(showModal: $store.showModal)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ModalView: View {
    @Environment(\.presentationMode) var presentation
    @Binding var showModal: Bool

    var body: some View {
        VStack {
            PermissionsView()
        }
    }
}

//struct AngroView_Previews: PreviewProvider {
//    static var previews: some View {
//        AngroView(tabSelection: .constant(1))
//    }
//}


