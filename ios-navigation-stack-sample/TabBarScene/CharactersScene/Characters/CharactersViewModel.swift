//
//  CharactersViewModel.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 20.10.2022.
//

import SwiftUI

class CharactersViewModel: ObservableObject {
    @Published var characters = Store.characters
}
