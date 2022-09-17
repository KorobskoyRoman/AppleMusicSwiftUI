//
//  LibraryModel.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 28.08.2022.
//

import Foundation

struct LibraryModel: Hashable {
    let id: UUID = UUID()
    var image: String
    var isSelected: Bool
    var title: String
}

final class CreateModel {
    static func createModel() -> [LibraryModel] {
        return [
            LibraryModel(image: "music.note.list", isSelected: false, title: "Плейлисты"),
            LibraryModel(image: "music.mic", isSelected: false, title: "Артисты"),
            LibraryModel(image: "square.stack", isSelected: false, title: "Альбомы"),
            LibraryModel(image: "music.note", isSelected: false, title: "Песни"),
            LibraryModel(image: "tv", isSelected: false, title: "Телешоу и фильмы"),
            LibraryModel(image: "music.note.tv", isSelected: false, title: "Видеоклипы"),
            LibraryModel(image: "guitars", isSelected: false, title: "Жанры"),
            LibraryModel(image: "person.2.crop.square.stack", isSelected: false, title: "Сборники"),
            LibraryModel(image: "music.quarternote.3", isSelected: false, title: "Авторы"),
            LibraryModel(image: "arrow.down.circle", isSelected: false, title: "Загружено"),
            LibraryModel(image: "music.note.house", isSelected: false, title: "Дополнительно")
        ]
    }
}
