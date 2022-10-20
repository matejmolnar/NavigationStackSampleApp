//
//  EpisodeDetailView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct EpisodeDetailView: View {
    @StateObject var model: EpisodeDetailViewModel
    
    var body: some View {
        List {
            ForEach(model.characters) { character in
                NavigationLink(value: TabRoute.character(character: character, route: nil)) {
                    Text(character.name)
                }
            }
        }
        .navigationTitle(model.title)
    }
}
