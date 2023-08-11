//
//  Extensions.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 21/06/2022.
//

import UIKit
import SwiftUI
import CryptoKit
import CommonCrypto
import Pulse
import PulseUI

extension String {
    
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
    func toDictionary() -> [String: Any]? {
        if let data = data(using: .utf8) {
            return try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        }
        return nil
    }
    
    var hash256: String {
        let inputData = Data(utf8)
        if #available(iOS 13.0, *) {
            let hashed = SHA256.hash(data: inputData)
            return hashed.compactMap { String(format: "%02x", $0) }.joined()
        } else {
            var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
            inputData.withUnsafeBytes { bytes in
                _ = CC_SHA256(bytes.baseAddress, UInt32(inputData.count), &digest)
            }
            return digest.makeIterator().compactMap { String(format: "%02x", $0) }.joined()
        }
    }
    
    var aes256: String?{
        let rawKey: [UInt8] = [46, 155, 23, 102, 200, 192, 144, 11, 98, 39, 145, 33, 154, 19, 173, 164, 24, 89, 240, 90, 7, 12, 148, 147, 133, 245, 237, 206, 177, 56, 5, 130]
        let ivData: [UInt8] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        var encryptedData: [UInt8]
        let data: [UInt8] = Array(self.utf8)
        encryptedData = testCrypt(data:data,   keyData:rawKey, ivData:ivData, operation:kCCEncrypt)!
        return NSData(bytes:encryptedData, length:encryptedData.count).base64EncodedString().base64Url
    }
    
    var base64Url: String?{
        return self.replacingOccurrences(of: "+", with: "-").replacingOccurrences(of: "/", with: "_")
    }
}

func testCrypt(data:[UInt8], keyData:[UInt8], ivData:[UInt8], operation:Int) -> [UInt8]? {
    let cryptLength  = size_t(data.count+kCCBlockSizeAES128)
    var cryptData    = [UInt8](repeating:0, count:cryptLength)
    let keyLength             = size_t(kCCKeySizeAES256)
    let algoritm: CCAlgorithm = UInt32(kCCAlgorithmAES128)
    let options:  CCOptions   = UInt32(kCCOptionPKCS7Padding)
    var numBytesEncrypted :size_t = 0
    let cryptStatus = CCCrypt(CCOperation(operation),
                              algoritm,
                              options,
                              keyData, keyLength,
                              ivData,
                              data, data.count,
                              &cryptData, cryptLength,
                              &numBytesEncrypted)
    if UInt32(cryptStatus) == UInt32(kCCSuccess) {
        cryptData.removeSubrange(numBytesEncrypted..<cryptData.count)
    } else {
        print("Error: \(cryptStatus)")
    }
    return cryptData;
}

extension UIViewController {
    
    func showToast(message: String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 25
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let loggerView = UIHostingController(rootView: ConsoleView())
            UIApplication.shared.topViewController()?.present(loggerView, animated: true)
        }
    }
}

extension UIWindow {
    static var key: UIWindow? {
        return UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .last { $0.isKeyWindow }
    }
}

extension UIApplication {
    func topViewController(controller: UIViewController? = UIWindow.key?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
