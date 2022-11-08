//
//  CharacterDetailRoute.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import Foundation

enum CharacterDetailRoute: Hashable {
    case sheet(CharacterSheetViewModel)
    
    init?(queryDict: [String: String]) {
        if let sheetText = queryDict["sheet"] {
            self = .sheet(.init(title: sheetText))
        } else {
            return nil
        }
    }
}
