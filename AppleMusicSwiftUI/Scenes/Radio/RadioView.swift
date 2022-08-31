//
//  RadioView.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 01.09.2022.
//

import SwiftUI

struct RadioView: View {
    @State private var genres = CreateRadioModel.createModel()
    private let contentRows = [GridItem(.fixed(200))]

    var body: some View {
        ScrollView(.vertical) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: contentRows) {
                    ForEach(0..<genres.count, id: \.self) { genre in
                        VStack {
                            Divider()
                            VStack(alignment: .leading, spacing: 5) {
                                Text(genres[genre].title)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text(genres[genre].name)
                                    .font(.title2)
                                Text(genres[genre].description ?? "")
                                    .foregroundColor(.secondary)
                                Image(genres[genre].image)
                                    .resizable()
                                    .cornerRadius(10)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 250)
                            }
                            .padding([.leading])
                        }
                    }
                }
            }
            ScrollView(.vertical) {

            }
        }
    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
