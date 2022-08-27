//
//  MainLibraryView.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 28.08.2022.
//

import SwiftUI

struct MainLibraryView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Ищите свою музыку?")
                .bold()
                .font(.title2)
                .padding()
            Text("Здесь появится купленная Вами в \niTunes Store музыка")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .navigationTitle("Медиатека")
    }
}

struct MainLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        MainLibraryView()
    }
}
