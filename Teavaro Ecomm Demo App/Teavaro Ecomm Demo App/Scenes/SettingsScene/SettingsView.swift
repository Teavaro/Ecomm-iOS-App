//
//  SettingsView.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI
import CoreData
import FunnelConnect
import Utiq
import Pulse
import PulseUI

struct SettingsView: View {
    
    @EnvironmentObject var store: Store
    @State var showingConfirmationAlert = false
    @State private var showModal1 = false
    @State var showingDataClearedAlert: Bool = false
    
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
                                self.showingConfirmationAlert.toggle()
                            })
                        }
                    }
                    Section(){
                        NavigationLink(destination: PermissionsView()) {
                            Text("CDP and UTIQ Consent")
                        }
                    }
                    Section(){
                        Toggle("Stub Mode", isOn: $store.isStub)
                            .onTapGesture {
                                TrackUtils.click(value: "stub_mode_\(!store.isStub)")
                                store.clearUtiqData()
                                var token = ""
                                if(!store.isStub){
                                    token = "523393b9b7aa92a534db512af83084506d89e965b95c36f982200e76afcb82cb"
                                }
                                UserDefaultsUtils.setStubToken(value: token)
                                showModal1.toggle()
                            }
                    }
                    Section(){
                        NavigationLink(destination: NotificationsView()) {
                            Text("Send Notifications")
                        }
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
                        Button("Network logs", action: {
                            let loggerView = UIHostingController(rootView: ConsoleView())
                            UIApplication.shared.topViewController()?.present(loggerView, animated: true)
                        })
                    }
                    Section(){
                        Button("Clear Data", action: {
                            TrackUtils.click(value: "clear_data")
                            showingDataClearedAlert.toggle()
//                            store.updatePermissions(om: false, nba: false, opt: false)
//                            store.updateUtiqPermission(consent: false)
                            store.clearData()
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
                            UserDefaultsUtils.setLogin(value: false)
                            store.isLogin = false
                            store.userId = nil
                        }),
                        secondaryButton: .cancel(Text("Cancel"))
                    )
                }
                .alert("Data cleared!", isPresented: $showingDataClearedAlert) {
                            Button("Ok", role: .cancel) { }
                }
            }
            .onAppear(perform: {
                TrackUtils.impression(value: "settings_view")
            })
            .sheet(isPresented: $showModal1, onDismiss: {
                print("showing ModalUtiqView:\(self.showModal1)")
            }) {
                ModalUtiqView(showModal: self.$showModal1)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
