//
//  UTIQConsentView.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 8/9/23.
//

import SwiftUI
import CoreData
import FunnelConnect
import Utiq

struct UTIQConsentView: View {
    
    @EnvironmentObject var store: Store
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
                .foregroundColor(.gray)
                .padding(.top, 15)
                .padding(.bottom, 2)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your consent will activate Utiq. Allowing this website to personalize your experience or use analysts whilst enabling your to retain control over your data. You can manage your Utiq choice and withdraw Utiq consent in 'ConsentHub' accessible below.")
            insertText(text: "Your movil operator:")
            Text("Uses your IP address to check eligibility to use the service and create a random value, know as network signal.")
            insertText(text: "UTIQ:")
            Text("Creates a randomized version of the network signal, known as 'ConsentPass', used to manage the Utiq service and Utiq consents.")
            insertText(text: "EcommDemoApp:")
            Text("Receives only two Utiq marketing passes used to provide you with personalized consent and advertising or analytics.")
            VStack{
                insertButton(title: "Accept", color: .green, action: {
                    TrackUtils.click(value: "accept_utiq_consent")
                    try? Utiq.shared.acceptConsent()
                    store.updateUtiqPermission(consent: true)
                    store.utiqStartService()
                    dismiss()
                })
                insertButton(title: "Reject", color: .gray, action: {
                    Utiq.shared.rejectConsent(successCallback: {
                        store.updateUtiqPermission(consent: false)
                        store.mtid = ""
                        UserDefaultsUtils.setMartechpass(value: "")
                        store.atid = ""
                    },errorCallback: {_ in
                        store.mtid = ""
                        UserDefaultsUtils.setMartechpass(value: "")
                        store.atid = ""})
                    TrackUtils.click(value: "reject_utiq_consent")
                    dismiss()
                })
            }
        }
        .padding(30)
        .navigationTitle("UTIQ Consent")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            TrackUtils.impression(value: "permissions_view")
        })
    }
}

struct UTIQConsent_Previews: PreviewProvider {
    static var previews: some View {
        PermissionsView()
    }
}

