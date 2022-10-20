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
                    NavigationLink(value: TabRoute.character(character: character, route: nil)) {
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
            .navigationDestination(for: TabRoute.self) { route in
                switch route {
                case let .character(character, .none):
                    CharacterDetailView(model: .init(character: character))
                case let .character(character, .sheet(sheetModel)):
                    CharacterDetailView(model: .init(character: character, sheetModel: sheetModel))
                case let .episode(episode):
                    EpisodeDetailView(model: .init(episode: episode))
                }
            }
        }
    }
}
