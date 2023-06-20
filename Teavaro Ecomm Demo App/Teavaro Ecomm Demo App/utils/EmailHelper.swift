//
//  EmailHelper.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 15/6/23.
//

import Foundation
import MessageUI

class EmailHelper: NSObject, MFMailComposeViewControllerDelegate {
    public static let shared = EmailHelper()
    private override init() {
        //
    }
    
    func sendEmail(subject:String, body:String, to:String){
        if !MFMailComposeViewController.canSendMail() {
            // Utilities.showErrorBanner(title: "No mail account found", subtitle: "Please setup a mail account")
            return //EXIT
        }
        
        let picker = MFMailComposeViewController()
        
        picker.setSubject(subject)
        picker.setMessageBody(body, isHTML: true)
        picker.setToRecipients([to])
        picker.mailComposeDelegate = self
        
//        EmailHelper.getRootViewController()?.present(picker, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        EmailHelper.getRootViewController()?.dismiss(animated: true, completion: nil)
    }
    
//    static func getRootViewController() -> UIViewController? {
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.rootViewController

         // OR If you use SwiftUI 2.0 based WindowGroup try this one
         // UIApplication.shared.windows.first?.rootViewController
//    }
}
