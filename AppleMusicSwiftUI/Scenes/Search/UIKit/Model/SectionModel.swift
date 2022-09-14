//
//  SectionModel.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 14.09.2022.
//

import Foundation

enum Section: Int, CaseIterable {
        case mainSection

        func description() -> String {
            switch self {
            case .mainSection:
                return "Поиск по категориям"
        }
    }
}
