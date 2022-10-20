//
//  OnboardingStep2View.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct OnboardingStep2View: View {
    @StateObject var model: OnboardingStep2ViewModel
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack {
            Button {
                model.complete()
                router.root = .login
            } label: {
                Text("Complete")
            }
        }
        .navigationTitle("Second Step")
    }
}
