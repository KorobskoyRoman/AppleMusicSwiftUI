//
//  MiniPlayerView.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 28.08.2022.
//

import SwiftUI

struct MiniPlayerView: View {
    @ViewBuilder var body: some View {
        HStack(spacing: 20) {
            Button(action: {}) {
                HStack {
                        Image(systemName: "music.note")
                            .foregroundColor(Color.secondary)
                            .padding(20)
                            .colorInvert()
                            .background(
                                Rectangle()
                                    .fill(Color.primary)
                                    .overlay(.black)
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(5)
                                    .shadow(radius: 5)
                            )
                    Text("Shake It Off").padding(.leading, 10)
                    Spacer()
                }
                .padding(10)
            }
            .buttonStyle(PlainButtonStyle())
            Button(action: {}) {
                Image(systemName: "play.fill").font(.title3)
            }
            .buttonStyle(PlainButtonStyle()).padding(.horizontal)
            Button(action: {}) {
                Image(systemName: "forward.fill").font(.title3)
            }
            .buttonStyle(PlainButtonStyle()).padding(.trailing, 30)
        }
        .padding(.horizontal)
        .background(Color.lightGray())
    }
}

struct MiniPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayerView()
    }
}
