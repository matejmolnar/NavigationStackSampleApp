//
//  CharacterDetailViewModel.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 20.10.2022.
//

import SwiftUI

class CharacterDetailViewModel: ObservableObject {
    @Published var sheetModel: CharacterSheetViewModel?
    @Published var title: String
    @Published var characters: [Character]
    
    init(characterId: Int, sheetModel: CharacterSheetViewModel? = nil) {
        _sheetModel = .init(initialValue: sheetModel)
        let character = Store.characters.first { $0.id == characterId }
        title = character?.name ?? ""
        characters = Store.characters
    }
}
