//
//  CharactersView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct CharactersView: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
        NavigationStack(path: $router.tabBar.charactersPath) {
            VStack {
                List(1..<10) { number in
                    NavigationLink(value: TabRoute.character(
                        character: Character(name: "Character \(number)"),
                        route: nil
                        )
                    ) {
                      Text("Character \(number)")
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
