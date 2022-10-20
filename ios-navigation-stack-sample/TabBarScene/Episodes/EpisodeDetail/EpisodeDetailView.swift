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
        .navigationTitle(model.title)
    }
}
