//
//  IDsView.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 15/5/23.
//

import SwiftUI
import CoreData
import funnelConnectSDK
import utiqSDK

struct IDsView: View {
    
    @EnvironmentObject var store: Store
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section{
                    Text("UserId:")
                        .bold()
                    Text(try! FunnelConnectSDK.shared.getUserId() ?? "")
                }
                Section{
                    Text("Umid:")
                        .bold()
                    Text(try! FunnelConnectSDK.shared.getUMID() ?? "")
                }
                Section{
                    Text("Atid:")
                        .bold()
                    Text(store.atid ?? "")
                }
                Section{
                    Text("Mtid")
                        .bold()
                    Text(store.mtid ?? "")
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
