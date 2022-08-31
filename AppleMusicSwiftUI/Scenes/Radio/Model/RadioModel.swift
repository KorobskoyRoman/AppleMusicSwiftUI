//
//  RadioModel.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 01.09.2022.
//

import Foundation

struct RadioModel: Hashable {
    let id: UUID = UUID()
    var image: String
    var title: String
    var name: String
    var description: String?
}

final class CreateRadioModel {
    static func createModel() -> [RadioModel] {
        return [
            RadioModel(image: "1", title: "Избранная радиостанция", name: "Хиты на русском", description: "Станция Apple Music"),
            RadioModel(image: "2", title: "Избранная радиостанция", name: "Чилаут", description: "Станция Apple Music"),
            RadioModel(image: "3", title: "Избранная радиостанция", name: "Поп-музыка", description: "Станция Apple Music"),
            RadioModel(image: "4", title: "Избранная радиостанция", name: "Танцевальная музыка", description: "Станция Apple Music"),
            RadioModel(image: "5", title: "Избранная радиостанция", name: "Хип-хоп на русском", description: "Станция Apple Music"),
            RadioModel(image: "6", title: "Избранная радиостанция", name: "Хиты", description: "Станция Apple Music"),
            RadioModel(image: "7", title: "Избранная радиостанция", name: "Хип-хоп", description: "Станция Apple Music"),
        ]
    }
}
