//
//  CharacterSheetViewModel.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 20.10.2022.
//

import SwiftUI

class CharacterSheetViewModel: ObservableObject, Identifiable, Hashable {
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    static func == (lhs: CharacterSheetViewModel, rhs: CharacterSheetViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: ObjectIdentifier {
      ObjectIdentifier(self)
    }
}
