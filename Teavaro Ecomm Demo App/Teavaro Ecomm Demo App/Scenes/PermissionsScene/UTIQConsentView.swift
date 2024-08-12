//
//  UTIQConsentView.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 8/9/23.
//

import SwiftUI
import CoreData
import FunnelConnect
import UTIQ

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
            Text("Your consent will activate Utiq. Allowing this website to personalise your experience or use analysts whilst enabling your to retain control over your data. You can manage your Utiq choice and withdraw Utiq consent in consenthub accessible below.")
            insertText(text: "Your movil operator:")
            Text("Uses your IP address to check eligibility to use the service and create a random value, know as network signal.")
            insertText(text: "UTIQ:")
            Text("Crates a randomised version of the network signal, know as consentpass, used to manage the Utiq service and Utiq consents.")
            insertText(text: "EcommDemoApp:")
            Text("Recives only two Utiq marketing passes used to provide you with personalised consent and advertising or analytics.")
            VStack{
                insertButton(title: "Accept", color: .green, action: {
                    TrackUtils.click(value: "accept_utiq_consent")
                    if(UTIQ.shared.isInitialized()){
                        try? UTIQ.shared.acceptConsent()
                    }
                    store.updateUtiqPermission(consent: true)
                    store.utiqStartService()
                    dismiss()
                })
                insertButton(title: "Reject", color: .gray, action: {
                    TrackUtils.click(value: "reject_utiq_consent")
                    store.updateUtiqPermission(consent: false)
                    try? UTIQ.shared.rejectConsent()
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

