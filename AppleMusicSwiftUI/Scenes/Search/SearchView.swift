//
//  SearchView.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 09.09.2022.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var categories = CreateSearchModel.createSearchModel()
    private let categoriesColumns = [GridItem(.fixed(200)), GridItem(.fixed(200))]
    private let cornerRadius: CGFloat = 15

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Поиск по категориям")
                    .font(.title2.weight(.bold))
                    .multilineTextAlignment(.leading)
                    .padding()

                Divider()

                LazyVGrid(columns: categoriesColumns, spacing: 10) {
                    ForEach(0..<$categories.count, id: \.self) { category in
                        NavigationLink(destination: SearchDetailView(title: $categories[category].title)) {
                        ZStack(alignment: .bottomLeading) {

                                Image(categories[category].image)
                                    .resizable(resizingMode: .stretch)
                                    .scaledToFill()
                                    .frame(width: 200, height: 150, alignment: .leading)
                                    .cornerRadius(cornerRadius)
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .background(LinearGradient(
                                        gradient: Gradient(
                                            colors: [.pink, .yellow, .purple, .orange]),
                                        startPoint: .trailing, endPoint: .leading))
                                    .opacity(0.4)
                                    .cornerRadius(cornerRadius)
                                Text(categories[category].title)
                                    .padding()
                                    .font(.title3.weight(.bold))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.white)
                                    .cornerRadius(cornerRadius)
                            }
                        }
                        .frame(width: 200, height: 110)
                        .padding(25)
                        .cornerRadius(cornerRadius)
                        .shadow(color: .black, radius: 5, x: 0, y: 5)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Ваша Медиатека")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
