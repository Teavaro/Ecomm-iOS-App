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
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    Section(){
                        NavigationLink(destination: PermissionsView()) {
                            Text("Consent Management")
                                .bold()
                        }
                    }
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
                        Button("Clear data", action: {
                            updatePermissions(om: false, nba: false, opt: false)
                            store.isFunnelConnectStarted = false
                            try? FunnelConnectSDK.shared.clearData()
                            try? FunnelConnectSDK.shared.clearCookies()
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
            })
        }
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
