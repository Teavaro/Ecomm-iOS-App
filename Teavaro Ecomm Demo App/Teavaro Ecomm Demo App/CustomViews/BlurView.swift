//
//  BlurView.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 30/06/2022.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    
    var style: UIBlurEffect.Style = .dark
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

extension View {
    func backgroundBlurEffect() -> some View {
        self.background(BlurView())
    }
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView()
    }
}
