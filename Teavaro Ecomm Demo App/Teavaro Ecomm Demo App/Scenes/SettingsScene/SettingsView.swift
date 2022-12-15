//
//  SettingsView.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI
import CoreData
import FunnelConnectSDK

struct SettingsView: View {
    
    @EnvironmentObject var store: Store
    @State var showingConfirmationAlert = false
    @State private var showModal1 = false
    @State private var isStub: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    Section(){
                        if(!store.isLogin){
                            NavigationLink(destination: LoginView()) {
                                Text("Login")
                                    .bold()
                            }
                        }
                        else{
                            Button("Logout", action: {
                                self.showingConfirmationAlert.toggle()
                            })
                        }
                    }
                    Section(){
                        NavigationLink(destination: PermissionsView()) {
                            Text("Consent Management")
                                .bold()
                        }
                    }
                    Section(){
                        Toggle("Stub Mode", isOn: $isStub)
                            .onTapGesture {
                                clearData()
                                UserDefaultsUtils.setStub(value: !isStub)
                                showModal1.toggle()
                            }
                    }
                    Section(){
                        Button("Send Notification", action: {
                            if let umid = try? FunnelConnectSDK.shared.cdp().getUmid(){
                                PushNotification().send(user: umid, message: "Swrve+App+Push+Notification")
                            }
                        })
                    }
                    Section(){
                        Button("Clear Data", action: {
//                            updatePermissions(om: false, nba: false, opt: false)
                            clearData()
                        })
                    }
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarItems(leading: TitleView(title: "Settings"))
                .navigationBarColor(backgroundColor: .white, titleColor: .black)
                .listStyle(.insetGrouped)
                .alert(isPresented: $showingConfirmationAlert) {
                    Alert(
                        title: Text("Logout confirmation"),
                        message: Text("Do you want to proceed with logout?"),
                        primaryButton: .destructive(Text("Proceed"), action: {
                            store.isLogin = false
                        }),
                        secondaryButton: .cancel(Text("Cancel"))
                    )
                }
            }
            .onAppear(perform: {
                try? FunnelConnectSDK.shared.cdp().logEvent(key: "Navigation", value: "settings")
                isStub = UserDefaultsUtils.isStub()
            })
            .sheet(isPresented: $showModal1, onDismiss: {
                print(self.showModal1)
            }) {
                ModalView1(showModal1: self.$showModal1)
            }
        }
    }
    
    fileprivate func clearData(){
        store.isFunnelConnectStarted = false
        try? FunnelConnectSDK.shared.clearData()
        try? FunnelConnectSDK.shared.clearCookies()
    }
    
    fileprivate func updatePermissions(om: Bool, nba: Bool, opt: Bool) {
        let permissions = PermissionsMap()
        permissions.addPermission(key: "CS-TMI",accepted: om)
        permissions.addPermission(key: "CS-OPT",accepted: opt)
        permissions.addPermission(key: "CS-NBA",accepted: nba)
        try? FunnelConnectSDK.shared.cdp().updatePermissions(permissions: permissions, notificationsName: "APP_CS", notificationsVersion: 4, dataCallback: {_ in
            UserDefaultsUtils.setPermissionsRequested(value: true)
        }, errorCallback: {_ in })
    }
}

struct ModalView1: View {
    @Environment(\.presentationMode) var presentation
    @Binding var showModal1: Bool

    var body: some View {
        VStack {
            PermissionsView()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
