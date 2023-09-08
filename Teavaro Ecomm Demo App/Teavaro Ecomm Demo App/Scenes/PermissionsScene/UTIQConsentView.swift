//
//  UTIQConsentView.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 8/9/23.
//

import SwiftUI
import CoreData
import funnelConnectSDK
import utiqSDK

struct UTIQConsentView: View {
    
    @EnvironmentObject var store: Store
    @State private var consent: Bool = true
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
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your consent will activate Utiq. Allowing this website to personalise your experience or use analysts whilst enabling your to retain control over your data. You can manage your Utiq choice and withdraw Utiq consent in consenthub accessible below.")
            VStack{
                insertButton(title: "Allow UTIQ services", color: .green, action: {
                    TrackUtils.click(value: "accept_utiq_consent")
                    store.updateUtiqPermission(consent: consent)
                    dismiss()
                })
                insertButton(title: "Deny UTIQ services", color: .gray, action: {
                    TrackUtils.click(value: "reject_utiq_consent")
                    store.clearData()
                    store.updatePermissions(om: false, nba: false, opt: false)
                    try? UTIQ.shared.rejectConsent()
                    dismiss()
                })
            }
        }
        .padding(30)
        .navigationTitle("UTIQ Consent")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            if let permissions = try? FunnelConnectSDK.shared.getPermissions(), !permissions.isEmpty(){
                self.consent = permissions.getPermission(key: store.keyUtiq)
            }
            TrackUtils.impression(value: "permissions_view")
        })
    }
}

struct UTIQConsent_Previews: PreviewProvider {
    static var previews: some View {
        PermissionsView()
    }
}

