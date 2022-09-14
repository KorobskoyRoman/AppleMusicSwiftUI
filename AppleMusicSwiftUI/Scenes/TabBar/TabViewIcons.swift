//
//  TabViewIcons.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 28.08.2022.
//

import SwiftUI

struct TabViewIcons: View {
    @State var expand = false
    @Namespace var animation

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            Divider()
            TabView {
                NavigationView {
                    LibraryView()
                        .navigationTitle("Медиатека")
                        .padding(.bottom, 80)
                }
                .tabItem {
                    Image(systemName: "rectangle.stack.badge.play.fill")
                    Text("Медиатека")
                }
                NavigationView {
                    RadioView()
                        .navigationTitle("Радио")
                        .padding(.bottom, 80)
                }
                .tabItem {
                    Image(systemName: "dot.radiowaves.left.and.right")
                    Text("Радио")
                }
                NavigationView {
//                    SearchView(viewModel: SearchViewModel())
                    SearchViewRepresentable()
                        .navigationTitle("Поиск")
                        .padding(.bottom, 80)
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }
            }
            .ignoresSafeArea(edges: .bottom)
            .accentColor(.red)

            MiniPlayerView(expand: $expand, animation: animation)
        }
        .background(BlurView())
    }
}

struct TabViewIcons_Previews: PreviewProvider {
    static var previews: some View {
        TabViewIcons()
    }
}
