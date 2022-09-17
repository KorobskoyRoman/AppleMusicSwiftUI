//
//  SearchViewRepresentable.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 14.09.2022.
//

import SwiftUI

struct SearchViewRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return UINavigationController(rootViewController: SearchViewController())
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
