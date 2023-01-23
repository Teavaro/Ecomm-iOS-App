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
    @Binding var tabSelection: Int
    @State private var showModal = false
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
                    
                    CeltraWebView(htmlContent: store.getBanner())
                        .frame(height: 70)
                    
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
                    FunnelConnectSDK.shared.didInitializeWithResult {
                        DispatchQueue.main.async {
                            print("excecuting FunnelConnectSDK.trustpid.startService()")
                            if let isConsentAccepted = try? FunnelConnectSDK.shared.trustPid().isConsentAccepted(){
                                if(isConsentAccepted){
                                    try? FunnelConnectSDK.shared.trustPid().startService(dataCallback: {_ in
                                        store.isFunnelConnectStarted = true
                                    }, errorCallback: {_ in
                                        
                                    })
                                }
                            }
                            print("excecuting FunnelConnectSDK.cdp.startService()")
                            try? FunnelConnectSDK.shared.cdp().startService(notificationsName: "APP_CS", notificationsVersion: 4, dataCallback: { data in
                                if let umid = try? FunnelConnectSDK.shared.cdp().getUmid() {
                                    store.isCdpStarted.toggle()
                                    store.infoResponse = data
                                    if let permissions = try? FunnelConnectSDK.shared.cdp().getPermissions(), permissions.isEmpty() {
                                        showModal.toggle()
                                    }
                                    print("excecuting SwrveSDK.start(withUserId: \(umid)")
                                    SwrveSDK.start(withUserId: umid)
                                    store.isFunnelConnectStarted = true
                                }
                            }, errorCallback: {_ in
                                
                            })
                        }
                    } failure: {_ in
                        
                    }
                }
                try? FunnelConnectSDK.shared.cdp().logEvent(key: "Navigation", value: "home")
            })
        }
        .sheet(isPresented: $showModal, onDismiss: {
            print(self.showModal)
        }) {
            ModalView(showModal: self.$showModal)
        }
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

struct AngroView_Previews: PreviewProvider {
    static var previews: some View {
        AngroView(tabSelection: .constant(1))
    }
}


