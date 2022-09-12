//
//  SearchView.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 09.09.2022.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @ObservedObject var viewModel: SearchViewModel
    private let categoriesColumns = [GridItem(.fixed(200)), GridItem(.fixed(200))]
    private let cornerRadius: CGFloat = 15

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Поиск по категориям")
                        .font(.title2.weight(.bold))
                        .multilineTextAlignment(.leading)
                        .padding()

                    Divider()
                }

                LazyVGrid(columns: categoriesColumns, spacing: 10) {
                    ForEach(0..<viewModel.categories.count, id: \.self) { category in
                        NavigationLink(destination: SearchDetailView(title: $viewModel.categories[category].title)) {
                            Image(viewModel.categories[category].image)
                                .resizable(resizingMode: .stretch)
                                .scaledToFill()
                                .frame(width: 200, height: 150, alignment: .leading)
                                .cornerRadius(cornerRadius)
                                .overlay(
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .background(LinearGradient(
                                            gradient: Gradient(
                                                colors: [.pink, .yellow, .purple, .orange]),
                                            startPoint: .trailing, endPoint: .leading))
                                        .opacity(0.4)
                                        .cornerRadius(cornerRadius)
                                )
                                .overlay(
                                    VStack(alignment: .leading) {
                                        HStack { Spacer() }
                                        Spacer()
                                        Text(viewModel.categories[category].title)
                                            .padding()
                                            .font(.title3.weight(.bold))
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(.white)
                                            .cornerRadius(cornerRadius)
                                    }
                                )
                        }
                        .frame(width: 200, height: 110)
                        .padding(25)
                        .cornerRadius(cornerRadius)
                        .shadow(color: .black, radius: 5, x: 0, y: 5)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Ваша Медиатека")  {
                let randomElements = [
                    viewModel.categories.randomElement()?.title,
                    viewModel.categories.randomElement()?.title,
                    viewModel.categories.randomElement()?.title,
                    viewModel.categories.randomElement()?.title
                ]

                ForEach(randomElements, id: \.self) { element in
                    Text(element ?? "")
                        .searchCompletion(element ?? "")
                }
            }
            .onSubmit(of: .search) {
                filterCategories()
            }
            .onChange(of: searchText) { _ in
                filterCategories()
            }
        }
    }

    private func filterCategories() {
        if searchText.isEmpty {
            viewModel.categories = CreateSearchModel.createSearchModel()
        } else {
            viewModel.categories = viewModel.categories.filter {
                $0.title.localizedStandardContains(searchText)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
