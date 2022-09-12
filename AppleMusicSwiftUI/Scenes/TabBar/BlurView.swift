//
//  BlurView.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 11.09.2022.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {

    }
}
