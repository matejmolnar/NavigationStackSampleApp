//
//  CharactersView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct CharactersView: View {
    @StateObject var model: CharactersViewModel
    
    @EnvironmentObject private var router: Router
    
    var body: some View {
        NavigationStack(path: $router.tabBar.charactersPath) {
            List {
                ForEach(model.characters) { character in
                    NavigationLink(value: CharactersRoute.character(id: character.id, route: nil)) {
                        Text(character.name)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        router.tabBar.isSettingsPresented = true
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .navigationTitle("Characters")
            .navigationDestination(for: CharactersRoute.self) { route in
                switch route {
                case let .character(id, .none):
                    CharacterDetailView(model: .init(characterId: id))
                case let .character(id, .sheet(sheetModel)):
                    CharacterDetailView(model: .init(characterId: id, sheetModel: sheetModel))
                }
            }
        }
    }
}
