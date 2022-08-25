//
//  ContentView.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 26.08.2022.
//

import SwiftUI

struct ContentView: View {
    private var isSelected = true
    var body: some View {
        ZStack {
            TabView {
                LibraryView()
                    .tabItem {
                        Image(systemName: "rectangle.stack.badge.play.fill")
                        Text("Медиатека")
                    }
                Text("Радио")
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Радио")
                    }
                Text("Поиск")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Поиск")
                    }
            }
            .accentColor(.red)
            MiniPlayerView()
                .padding(.top, 650)
        }
    }
}

struct LibraryView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Ищите свою музыку?")
                    .bold()
                    .font(.title2)
                    .padding()
                Text("Здесь появится купленная Вами в \niTunes Store музыка")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
            .navigationTitle("Медиатека")
        }
    }
}

struct MiniPlayerView: View {
    var body: some View {
        HStack {
            Image(systemName: "")
                .frame(width: 50, height: 50)
            Text("Не исполняется")
            Button(action: {
                //
            }, label: {
                Image(systemName: "play.fill")
                    .foregroundColor(.black)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
