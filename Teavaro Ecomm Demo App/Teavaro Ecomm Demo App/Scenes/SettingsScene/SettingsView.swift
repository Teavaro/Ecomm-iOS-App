//
//  SettingsView.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI
import CoreData
//import FunnelConnectSDK
import utiqSDK

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
                            }
                        }
                        else{
                            Button("Logout", action: {
                                TrackUtils.click(value: "logout")
                                UserDefaultsUtils.setLogin(value: false)
                                self.showingConfirmationAlert.toggle()
                            })
                        }
                    }
                    Section(){
                        NavigationLink(destination: PermissionsView()) {
                            Text("Consent Management")
                        }
                    }
                    Section(){
                        Toggle("Stub Mode", isOn: $isStub)
                            .onTapGesture {
                                TrackUtils.click(value: "stub_mode_\(!isStub)")
                                clearData()
                                UserDefaultsUtils.setStub(value: !isStub)
                                showModal1.toggle()
                            }
                    }
                    Section(){
//                    if (store.isCdpStarted) {
                        NavigationLink(destination: NotificationsView()) {
                            Text("Send Notifications")
                        }
//                    }
                    }
                    Section(){
                        NavigationLink(destination: ShareLinksView()) {
                            Text("Share Links")
                        }
                    }
                    Section(){
                        NavigationLink(destination: IDsView()) {
                            Text("IDs")
                        }
                    }
                    Section(){
                        Button("Clear Data", action: {
                            TrackUtils.click(value: "clear_data")
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
                            TrackUtils.click(value: "logout_confirm")
                            store.isLogin = false
                        }),
                        secondaryButton: .cancel(Text("Cancel"))
                    )
                }
            }
            .onAppear(perform: {
                TrackUtils.impression(value: "settings_view")
                isStub = UserDefaultsUtils.isStub()
            })
            .sheet(isPresented: $showModal1, onDismiss: {
                print(self.showModal1)
            }) {
                ModalView1(showModal1: self.$showModal1)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    fileprivate func clearData(){
        store.clearData()
//        try? FunnelConnectSDK.shared.clearData()
//        try? FunnelConnectSDK.shared.clearCookies()
    }
    
    fileprivate func updatePermissions(om: Bool, nba: Bool, opt: Bool) {
//        let permissions = PermissionsMap()
//        permissions.addPermission(key: "CS-OM",accepted: om)
//        permissions.addPermission(key: "CS-OPT",accepted: opt)
//        permissions.addPermission(key: "CS-NBA",accepted: nba)
//        permissions.addPermission(key: "CS-TPID",accepted: nba)
//        try? FunnelConnectSDK.shared.cdp().updatePermissions(permissions: permissions, notificationsName: "MAIN_CS", notificationsVersion: 1, dataCallback: {_ in
//            UserDefaultsUtils.setPermissionsRequested(value: true)
//        }, errorCallback: {_ in })
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
