//
//  SearchDetailView.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 09.09.2022.
//

import SwiftUI

struct SearchDetailView: View {
    @Binding var title: String
    @State private var categories = CreateSearchModel.createDetailSearchModel()
    private let rows = [GridItem(.fixed(200))]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title.weight(.bold))
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    MainDetailCategories(rows: rows, categories: categories[0])
                }

                makeInsetTitle(title: "Избранные плейлисты", hasButton: false)

                ScrollView(.horizontal, showsIndicators: false) {
                    FavoriteDetailCategories(rows: rows, categories: categories[1])
                }

                makeInsetTitle(title: "\(title): \nновинки", hasButton: true)

                ScrollView(.horizontal, showsIndicators: false) {
                    NewDetailCategories(rows: rows, categories: categories[2])
                }

                Divider()
                makeInsetTitle(title: "Лучшие новые треки", hasButton: true)

                ScrollView(.horizontal, showsIndicators: false) {
                    BestNewView(categories: categories[3])
                        .frame(height: 250, alignment: .topLeading)
                }
            }
        }
        .padding(.bottom, 85)
    }

    private func makeInsetTitle(title: String, hasButton: Bool) -> some View {
        return VStack(alignment: .leading) {
            Divider()
                .padding([.horizontal, .top])
            HStack {
                Text(title)
                    .font(.title2.weight(.bold))
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)

                if hasButton {
                    Button("См. все") {
                        print(#function)
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }
}

struct MainDetailCategories: View {
    let rows: [GridItem]
    @State var categories: [SearchCell]

    var body: some View {
        LazyHGrid(rows: rows) {
            ForEach(0..<$categories.count, id: \.self) { index in
                VStack(alignment: .leading, spacing: 5) {
                    Divider()
                    Text(categories[index].description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(categories[index].mixtapeTitle ?? "")
                        .font(.title2)
                    Text(categories[index].artistTitle ?? "")
                        .foregroundColor(.secondary)
                    Image(categories[index].image)
                        .resizable()
                        .cornerRadius(10)
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct FavoriteDetailCategories: View {
    let rows: [GridItem]
    @State var categories: [SearchCell]

    var body: some View {
        LazyHGrid(rows: rows) {
            ForEach(0..<categories.count, id: \.self) { index in
                VStack(alignment: .leading, spacing: 5) {
                    Image(categories[index].image)
                        .resizable(resizingMode: .stretch)
                        .scaledToFill()
                        .frame(width: 200, height: 200, alignment: .leading)
                        .clipped()
                        .cornerRadius(10)
                    Text(categories[index].mixtapeTitle ?? "")
                    Text(categories[index].description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct NewDetailCategories: View {
    let rows: [GridItem]
    @State var categories: [SearchCell]

    var body: some View {
        LazyHGrid(rows: rows) {
            ForEach(0..<categories.count, id: \.self) { index in
                VStack(alignment: .leading, spacing: 5) {
                    Image(categories[index].image)
                        .resizable(resizingMode: .stretch)
                        .scaledToFill()
                        .frame(width: 200, height: 200, alignment: .leading)
                        .clipped()
                        .cornerRadius(10)
                    Text(categories[index].artistTitle ?? "")
                    Text(categories[index].description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct BestNewView: View {
    let rows = [
        GridItem(.adaptive(minimum: 200)),
        GridItem(.adaptive(minimum: 200)),
        GridItem(.adaptive(minimum: 200)),
        GridItem(.adaptive(minimum: 200))
    ]
    @State var categories: [SearchCell]

    var body: some View {
        LazyHGrid(rows: rows) {
            ForEach(0..<categories.count, id: \.self) { index in
                HStack(alignment: .center, spacing: 5) {
                    Image(categories[index].image)
                        .resizable()
                        .cornerRadius(10)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50,height: 50, alignment: .leading)
                        .clipped()

                    VStack {
                        Text(categories[index].description)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(categories[index].artistTitle ?? "")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    Button {
                        print(categories[index].description)
                    } label: {
                        Image(systemName: "circle.grid.2x1.fill")
                            .foregroundColor(.black)
                    }
                }
                .frame(width: 320, alignment: .leading)
                .padding(.vertical)
            }
        }
        .padding(.horizontal)
    }
}

struct SearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetailView(title: .constant("Title"))
    }
}

