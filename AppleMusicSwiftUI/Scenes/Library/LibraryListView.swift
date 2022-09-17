//
//  LibraryListView.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 28.08.2022.
//

import SwiftUI

struct LibraryListView: View {

    @State private var categories = CreateModel.createModel()
    @State private var selection: Set<LibraryModel> = Set<LibraryModel>()

    init() {
        UINavigationBar.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        List (selection: $selection) {
            ForEach(0..<categories.count, id: \.self) { category in
                HStack {
                    Image(systemName: self.categories[category].image)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.red)
                    Text(categories[category].title)
                }
            }
            .onMove(perform: move)
        }
        .foregroundColor(.red)
        .navigationTitle("Медиатека")
        .listStyle(.inset)
    }

    private func move(from source: IndexSet, to destination: Int) {
        categories.move(fromOffsets: source, toOffset: destination)
    }
}

struct LibraryListView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryListView()
    }
}
