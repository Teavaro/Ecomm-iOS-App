//
//  ShareLinks.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 15/5/23.
//

import SwiftUI
import CoreData
import funnelConnectSDK
import utiqSDK

struct ShareLinksView: View {
    
    @EnvironmentObject var store: Store
    @Environment(\.dismiss) private var dismiss
    @State var shareText: ShareText?
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section(){
                    Button("Click Idend link", action: {
                        TrackUtils.click(value: "share_ident_click_link")
                        if let link = store.getClickIdentLink(){
                            shareText = ShareText(text: link)
                        }
                    })
                }
                Section(){
                    Button("Abandoned Cart link", action: {
                        TrackUtils.click(value: "share_ac_link")
                        if let link = store.getAbCartLink(){
                            shareText = ShareText(text: link)
                        }
                    })
                }
            }
        }
        .navigationTitle("Share Links")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(backgroundColor: .white, titleColor: .black)
        .listStyle(.insetGrouped)
        .onAppear(perform: {
            TrackUtils.impression(value: "share_links_view")
        })
        .sheet(item: $shareText) { shareText in
            ActivityView(text: shareText.text)
        }
    }
    
//    func openShareDialog(subject: String, link: String){
//        let mailTo = ""
//        if let urlString = "mailto:\(mailTo)?subject=\(subject)&body=\(link)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
//           let url = URL(string: urlString) {
//            UIApplication.shared.open(url, completionHandler: nil)
//        }
//        else {
//            print("Error")
//        }
//    }
}


struct ShareLinksView_Previews: PreviewProvider {
    static var previews: some View {
        ShareLinksView()
    }
}

struct ActivityView: UIViewControllerRepresentable {
    let text: String

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: [text], applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {}
}

struct ShareText: Identifiable {
    let id = UUID()
    let text: String
}
