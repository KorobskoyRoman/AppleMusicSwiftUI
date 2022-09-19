//
//  SearchDetailHostingController.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 19.09.2022.
//

import SwiftUI

final class SearchDetailHostingController: UIHostingController<SearchDetailView> {

    init(title: Binding<String>) {
        super.init(rootView: SearchDetailView(title: title))
    }

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
