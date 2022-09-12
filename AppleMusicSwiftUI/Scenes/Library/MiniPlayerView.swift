//
//  MiniPlayerView.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 28.08.2022.
//

import SwiftUI

struct MiniPlayerView: View {
    @State var duration: Float = 0
    @State var volume: Float = 0.5
    @Binding var expand: Bool

    var animation: Namespace.ID
    var height = UIScreen.main.bounds.height / 3
    var safeArea = UIApplication.shared.windows.first?.safeAreaInsets

    @ViewBuilder var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray)
                .frame(width: expand ? 60 : 0, height: expand ? 4 : 0)
                .opacity(expand ? 1 : 0)
                .padding(.top, expand ? safeArea?.top : 0)
                .padding(.vertical, expand ? 30 : 0)

            HStack(spacing: 20) {

                if expand {
                    Spacer()
                }

                HStack {
                    Image("ss3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: expand ? height : 50, height: expand ? height : 50)
                        .cornerRadius(5)

                    if !expand {
                        Text("Did it again").padding(.leading, 10)
                            .matchedGeometryEffect(id: "Label", in: animation)
                        Spacer()
                    }
                }
                .padding(10)

                Spacer()

                if !expand {
                    Button(action: {}) {
                        Image(systemName: "play.fill").font(.title3)
                    }
                    .buttonStyle(PlainButtonStyle()).padding(.horizontal)
                    Button(action: {}) {
                        Image(systemName: "forward.fill").font(.title3)
                    }
                    .buttonStyle(PlainButtonStyle()).padding(.trailing, 30)
                }
            }

            VStack {

                HStack {
                    if expand {
                        VStack(alignment: .leading) {
                            Text("Did it again").padding(.leading, 10)
                                .font(.title3.weight(.bold))
                                .foregroundColor(.primary)
                                .matchedGeometryEffect(id: "Label", in: animation)

                            Text("Lil Tecca")
                                .font(.title3.weight(.bold))
                                .foregroundColor(.secondary)
                                .matchedGeometryEffect(id: "Label2", in: animation)
                        }

                        Spacer(minLength: 0)

                        Button(action: {}) {
                            Image(systemName: "ellipsis.circle")
                                .font(.title2)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                .padding(.top, 20)

                VStack {
                    let songDuration: Float = 202

                    Slider(value: $duration, in: 0...songDuration)
                        .accentColor(.gray)

                    HStack {
                        Text(makeRound(Int(duration)))
                            .font(.system(size: 10, weight: .regular, design: .default))
                            .foregroundColor(.gray)

                        Spacer(minLength: 0)

                        Text(makeRound(Int(duration) - Int(songDuration)))
                            .font(.system(size: 10, weight: .regular, design: .default))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.top, -10)
                .padding(.horizontal)

                VStack {
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "backward.fill")
                                .resizable()
                                .foregroundColor(.primary)
                                .frame(width: 50, height: 35)
                        }

                        Spacer()

                        Button(action: {}) {
                            Image(systemName: "play.fill")
                                .resizable()
                                .foregroundColor(.primary)
                                .frame(width: 50, height: 50)
                        }

                        Spacer()

                        Button(action: {}) {
                            Image(systemName: "forward.fill")
                                .resizable()
                                .foregroundColor(.primary)
                                .frame(width: 50, height: 35)
                        }
                        Spacer()
                    }
                    .padding()

                    Spacer(minLength: 0)

                    HStack {
                        Image(systemName: "speaker.fill")

                        Slider(value: $volume)
                            .accentColor(.gray)

                        Image(systemName: "speaker.wave.3.fill")
                    }
                    .foregroundColor(.primary)
                    .padding()

                    Spacer(minLength: 0)

                    HStack(spacing: 80) {
                        Button(action: {}) {
                            Image(systemName: "quote.bubble")
                                .font(.title2)
                                .foregroundColor(.primary)
                        }

                        Button(action: {}) {
                            Image(systemName: "airplayaudio")
                                .font(.title2)
                                .foregroundColor(.primary)
                        }

                        Button(action: {}) {
                            Image(systemName: "list.bullet")
                                .font(.title2)
                                .foregroundColor(.primary)
                        }
                    }
                    Spacer(minLength: 0)
                }

                Spacer(minLength: 0)
            }
            .frame(width: expand ? nil : 0, height: expand ? nil : 0)
            .opacity(expand ? 1 : 0)
        }
        .frame(maxHeight: expand ? .infinity : 80)
        .padding(.horizontal)
        .background(
            VStack(spacing: 0) {
                BlurView()
                Divider()
            }
                .onTapGesture(perform: {
                    withAnimation(.spring()) {
                        expand.toggle()
                    }
                })
        )
        .ignoresSafeArea()
        .offset(y: expand ? 0 : -48)
    }

    private func makeRound(_ value: Int) -> String {
        return "\((value % 3600) / 60):\((abs(value) % 3600) % 60)"
    }
}

//struct MiniPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        MiniPlayerView(animation: , expand: Binding(true))
//    }
//}
