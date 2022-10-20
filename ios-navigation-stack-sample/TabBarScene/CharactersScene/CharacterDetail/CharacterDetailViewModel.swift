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
    @Published var episodes: [Episode]
    
    init(character: Character, sheetModel: CharacterSheetViewModel? = nil) {
        _sheetModel = .init(initialValue: sheetModel)
        title = character.name
        episodes = Store.episodes
    }
}
