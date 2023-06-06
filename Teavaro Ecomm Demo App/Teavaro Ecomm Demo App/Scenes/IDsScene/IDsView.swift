//
//  IDsView.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 15/5/23.
//

import SwiftUI
import CoreData
import FunnelConnectSDK

struct IDsView: View {
    
    @EnvironmentObject var store: Store
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section{
                    Text("UserId:")
                        .bold()
                    Text(try! FunnelConnectSDK.shared.cdp().getUserId() ?? "")
                }
                Section{
                    Text("Umid:")
                        .bold()
                    Text(try! FunnelConnectSDK.shared.cdp().getUmid() ?? "")
                }
                Section{
                    Text("Mtid:")
                        .bold()
                    Text("")
                }
            }
        }
        .navigationTitle("IDs")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(backgroundColor: .white, titleColor: .black)
        .listStyle(.insetGrouped)
        .onAppear(perform: {
            TrackUtils.impression(value: "IDs_view")
        })
    }
}


struct IDsView_Previews: PreviewProvider {
    static var previews: some View {
        IDsView()
    }
}
