//
//  PermissionsView.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI
import CoreData
import funnelConnectSDK
import utiqSDK

struct PermissionsView: View {
    
    @EnvironmentObject var store: Store
    @State private var om: Bool = false
    @State private var nba: Bool = false
    @State private var tpid: Bool = false
    @State private var opt: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    fileprivate func insertButton(title: String, color: Color, action: @escaping() -> Void) -> some View {
        return Button {
            action()
        } label: {
            Text(title)
                .bold()
                .foregroundColor(.white)
        }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .frame(maxWidth: .infinity, alignment: .center)
            .background(color)
            .cornerRadius(5)
            .padding(.top, 10)
    }
    
    fileprivate func insertText(text: String) -> some View  {
        return HStack {
            Text(text)
            Text("*")
                .foregroundColor(.orange)
        }
        .padding(.top, 25)
    }
    
    fileprivate func updatePermissions(om: Bool, nba: Bool, opt: Bool, tpid: Bool) {
        print("excecuting updatePermissions")
        let permissions = Permissions()
        permissions.addPermission(key: "CS-OM",accepted: om)
        permissions.addPermission(key: "CS-OPT",accepted: opt)
        permissions.addPermission(key: "CS-NBA",accepted: nba)
        permissions.addPermission(key: "CS-TPID",accepted: tpid)
        FunnelConnectSDK.shared.updatePermissions(permissions: permissions, notificationsName: "MAIN_CS", notificationsVersion: 1, dataCallback: {_ in
            UserDefaultsUtils.setPermissionsRequested(value: true)
        }, errorCallback: {_ in })
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Analytics Tracking:")
                .foregroundColor(.gray)
            Toggle("Used for reporting and optimisation.", isOn: $om)
            Text("Personalisation:")
                .foregroundColor(.gray)
                .padding(.top, 30)
            Toggle("Used to deliver personalised experiences.", isOn: $opt)
            Text("Network Token:")
                .foregroundColor(.gray)
                .padding(.top, 30)
            Toggle("This enables us to use a mobile network token to collect behavioural data for analytics and personalisation.", isOn: $nba)
            HStack{
                insertButton(title: "Reject All", color: .gray, action: {
                    TrackUtils.click(value: "reject_permissions")
                    updatePermissions(om: false, nba: false, opt: false, tpid: false)
                    try? UTIQ.shared.rejectConsent()
                    dismiss()
                })
                insertButton(title: "Accept All", color: .green, action: {
                    TrackUtils.click(value: "accept_permissions")
                    updatePermissions(om: true, nba: true, opt: true, tpid: true)
                    startTrustPid()
                    dismiss()
                })
            }
            insertButton(title: "Save settings", color: Color(UIColor.lightGray), action: {
                TrackUtils.click(value: "save_permissions")
                updatePermissions(om: self.om, nba: self.nba, opt: self.opt, tpid: self.tpid)
                if(self.nba) {
                    startTrustPid()
                }
                else{
                    try? UTIQ.shared.rejectConsent()
                }
                dismiss()
            })
            Spacer()
        }
        .padding(30)
        .navigationTitle("Permissions")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            if let permissions = try? FunnelConnectSDK.shared.getPermissions(){
                self.om = permissions.getPermission(key: "CS-OM")
                self.opt = permissions.getPermission(key: "CS-OPT")
                self.nba = permissions.getPermission(key: "CS-NBA")
                self.tpid = permissions.getPermission(key: "CS-TPID")
            }
            TrackUtils.impression(value: "permissions_view")
        })
    }
}

func startTrustPid(){
    try? UTIQ.shared.acceptConsent()
    let isStub = UserDefaultsUtils.isStub()
    try? UTIQ.shared.startService(isStub: isStub)
}

struct Permissions_Previews: PreviewProvider {
    static var previews: some View {
        PermissionsView()
    }
}
