//
//  SearchModel.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 09.09.2022.
//

import Foundation

struct SearchModel: Hashable {
    let id: UUID = UUID()
    var image: String
    var title: String
}

struct SearchCell: Hashable {
    var description: String
    var mixtapeTitle: String?
    var artistTitle: String?
    var image: String
}

final class SearchViewModel: ObservableObject {
    @Published var categories = [SearchModel]()
    @Published var cellInfo = [[SearchCell]]()

    init() {
        updateModel()
    }

    private func updateModel() {
        self.categories = CreateSearchModel.createSearchModel()
        self.cellInfo = CreateSearchModel.createDetailSearchModel()
    }
}

final class CreateSearchModel {
    static func createSearchModel() -> [SearchModel] {
        return [
            SearchModel(image: "s1", title: "Главное"),
            SearchModel(image: "s2", title: "Рок"),
            SearchModel(image: "s3", title: "Классика"),
            SearchModel(image: "s4", title: "Джаз"),
            SearchModel(image: "s5", title: "Джаз для всех"),
            SearchModel(image: "s6", title: "Популярное"),
            SearchModel(image: "s7", title: "Инструментал"),
            SearchModel(image: "s8", title: "Пространственное аудио")
        ]
    }

    static func createDetailSearchModel() -> [[SearchCell]] {
        return [
            [
                SearchCell(description: "Теперь в Apple Music!", mixtapeTitle: "Mixtape, Vol. 1 - EP", artistTitle: "Better than you", image: "ss1"),
                SearchCell(description: "Избранный альбом", mixtapeTitle: "We love you Tecca 2", artistTitle: "Lil Tecca", image: "ss2"),
                SearchCell(description: "Избранный альбом", mixtapeTitle: "We love you Tecca", artistTitle: "Lil Tecca", image: "ss3")
            ],
            [
                SearchCell(description: "Apple Music", mixtapeTitle: "Рускоязычные хиты", image: "1"),
                SearchCell(description: "Apple Music чилаут", mixtapeTitle: "Чилаут микс", image: "2"),
                SearchCell(description: "Apple Music поп", mixtapeTitle: "Поп-музыка", image: "3")
            ],
            [
                SearchCell(description: "Faster", artistTitle: "Lil Tecca", image: "ss4"),
                SearchCell(description: "Omegashima", artistTitle: "Tokyo Rider", image: "ss5"),
                SearchCell(description: "The Infamous", artistTitle: "Mobb Deep", image: "ss6")
            ],
            [
                SearchCell(description: "NEIGHBORHOOD SUPERSTAR", artistTitle: "DaBaby, NBA YoungBoy", image: "ss1"),
                SearchCell(description: "Ransom", artistTitle: "Lil Tecca", image: "ss2"),
                SearchCell(description: "Did it again", artistTitle: "Lil Tecca", image: "ss2"),
                SearchCell(description: "Amigo", artistTitle: "Lil Tecca", image: "ss2"),
                SearchCell(description: "Repeat it (with Gunna)", artistTitle: "Lil Tecca", image: "ss3"),
                SearchCell(description: "Faster", artistTitle: "Lil Tecca", image: "ss4"),
                SearchCell(description: "Empty streets", artistTitle: "Tokyo Rider", image: "ss5"),
                SearchCell(description: "Survival of the Fittest", artistTitle: "Mobb Deep", image: "ss6")
            ]
        ]
    }
}
