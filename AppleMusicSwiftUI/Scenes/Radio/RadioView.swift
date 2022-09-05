//
//  RadioView.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 01.09.2022.
//

import SwiftUI

struct RadioView: View {
    var body: some View {
        ScrollView(.vertical) {
            ScrollView(.horizontal, showsIndicators: false) {
                GenresView()
            }.padding(.horizontal)
            
            Divider()
                .padding()

            StationView()
                .padding()
        }
        .padding(.bottom)
    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
