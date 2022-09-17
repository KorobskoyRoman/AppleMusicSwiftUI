//
//  LibraryView.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 28.08.2022.
//

import SwiftUI

struct LibraryView: View {

    @State private var isEditing = false
    @State private var editMode = EditMode.active

    var body: some View {
        mainView
            .transition(.slide)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            isEditing.toggle()
                        }
                    }, label: {
                        Text(isEditing ? "Готово" : "Править")
                            .foregroundColor(.red)
                    })
                }
            }
            .environment(\.editMode, $editMode)
    }

    private var mainView: some View {
        return isEditing ? AnyView(LibraryListView()) : AnyView(MainLibraryView())
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
