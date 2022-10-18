//
//  CharacterDetailView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

class CharacterDetailViewModel: ObservableObject {
    @Published var sheetModel: CharacterSheetModel?
    @Published var title: String
    
    init(character: Character, sheetModel: CharacterSheetModel? = nil) {
        _sheetModel = .init(initialValue: sheetModel)
        title = character.name
    }
}

struct CharacterDetailView: View {
    @StateObject var model: CharacterDetailViewModel
    
    var body: some View {
        VStack {
            List(1..<10) { number in
                NavigationLink(value: TabRoute.episode(Episode(name: "Episode \(number)"))) {
                  Text("Episode \(number)")
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
