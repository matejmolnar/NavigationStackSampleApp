//
//  CharacterSheetView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct CharacterSheetView: View {
    @StateObject var model: CharacterSheetViewModel
    
    var body: some View {
        VStack {
            Text(model.title)
        }
    }
}
