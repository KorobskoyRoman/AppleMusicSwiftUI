//
//  StationView.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 01.09.2022.
//

import SwiftUI

struct StationView: View {
    @State private var stations = CreateRadioModel.createRadioStations()
    private let stationsColumns = [GridItem(.fixed(400))]
    
    var body: some View {
        LazyVGrid(columns: stationsColumns) {
            VStack(alignment: .leading) {
                Text("Станции")
                    .font(.title2.weight(.bold))
                    .multilineTextAlignment(.leading)
                ForEach(0..<stations.count, id: \.self) { station in
                    HStack {
                        Image(stations[station].image)
                            .resizable(resizingMode: .stretch)
                            .scaledToFill()
                            .frame(width: 150, height: 150, alignment: .leading)
                            .cornerRadius(10)

                        VStack(alignment: .leading) {
                            Spacer()
                            Text(stations[station].title)
                                .font(.body.weight(.medium))
                            Text(stations[station].description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Spacer()
                            Divider()
                        }
                    }
                    .padding(.bottom)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView()
    }
}
