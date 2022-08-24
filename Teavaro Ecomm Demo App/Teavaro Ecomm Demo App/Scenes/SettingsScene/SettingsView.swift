//
//  SettingsView.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI
import CoreData

struct SettingsView: View {
    
    @EnvironmentObject var store: Store
    @State var showingConfirmationAlert = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    Section(){
                        NavigationLink(destination: PermissionsView()) {
                            Text("Permissions")
                                .bold()
                        }
                    }
                    Section(){
                        if(!store.isLogin){
                            NavigationLink(destination: Login1View()) {
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
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
