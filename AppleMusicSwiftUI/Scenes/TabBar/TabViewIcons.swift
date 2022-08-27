//
//  TabViewIcons.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 28.08.2022.
//

import SwiftUI

struct TabViewIcons: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            Divider()
            TabView {
                LibraryView()
                    .tabItem {
                        Image(systemName: "rectangle.stack.badge.play.fill")
                        Text("Медиатека")
                    }
                Text("")
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Радио")
                    }
                Text("")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Поиск")
                    }
            }
            .ignoresSafeArea(edges: .bottom)
            .accentColor(.red)
            .padding(.horizontal)

            MiniPlayerView()
                .padding(.bottom, 50)
        }
    }
}

struct TabViewIcons_Previews: PreviewProvider {
    static var previews: some View {
        TabViewIcons()
    }
}
