//
//  LibraryListView.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 28.08.2022.
//

import SwiftUI

struct LibraryListView: View {

    @State private var categories = CreateModel.createModel()

    init() {
        UINavigationBar.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        List {
            ForEach(0..<categories.count) { category in
                Toggle(isOn: self.$categories[category].isSelected) {
                    Image(systemName: self.categories[category].image)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.red)
                    Text(categories[category].title)
                }
                .toggleStyle(CheckboxStyle())
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

struct CheckboxStyle: ToggleStyle {

    func makeBody(configuration: Self.Configuration) -> some View {

        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(configuration.isOn ? .red : .red)
                .font(.system(size: 20, weight: .regular, design: .default))
                configuration.label
        }
        .onTapGesture { configuration.isOn.toggle() }

    }
}

struct LibraryListView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryListView()
    }
}
