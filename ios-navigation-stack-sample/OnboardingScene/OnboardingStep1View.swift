//
//  OnboardingStep1View.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct OnboardingStep1View: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack {
            Button {
                router.onboardingPath.append(.step2)
            } label: {
                Text("Next")
            }
        }
        .navigationTitle("First Step")
    }
}
