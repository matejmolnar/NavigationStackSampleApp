//
//  CharacterDetailView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct CharacterDetailView: View {
    @StateObject var model: CharacterDetailViewModel
    
    var body: some View {
        List {
            ForEach(model.episodes) { episode in
                NavigationLink(value: TabRoute.episode(episode)) {
                    Text(episode.name)
                }
            }
        }
        .navigationTitle(model.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    model.sheetModel = .init(title: "Character sheet")
                } label: {
                    Image(systemName: "doc.text")
                }
            }
        }
        .sheet(item: $model.sheetModel) { model in
            CharacterSheetView(model: model)
        }
    }
}
