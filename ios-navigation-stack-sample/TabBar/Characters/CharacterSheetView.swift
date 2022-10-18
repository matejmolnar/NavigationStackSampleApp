//
//  CharacterSheetView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

class CharacterSheetModel: Identifiable, Hashable {
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    static func == (lhs: CharacterSheetModel, rhs: CharacterSheetModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: ObjectIdentifier {
      ObjectIdentifier(self)
    }
}

struct CharacterSheetView: View {
    let model: CharacterSheetModel
    
    var body: some View {
        VStack {
            Text(model.title)
        }
    }
}
