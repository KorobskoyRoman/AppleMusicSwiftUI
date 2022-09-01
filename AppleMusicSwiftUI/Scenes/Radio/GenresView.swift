//
//  GenresView.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 01.09.2022.
//

import SwiftUI

struct GenresView: View {
    @State private var genres = CreateRadioModel.createRadioModel()
    private let contentRows = [GridItem(.fixed(200))]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: contentRows) {
                ForEach(0..<genres.count, id: \.self) { genre in
                    VStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Divider()
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
    }
}

struct GenresView_Previews: PreviewProvider {
    static var previews: some View {
        GenresView()
    }
}
