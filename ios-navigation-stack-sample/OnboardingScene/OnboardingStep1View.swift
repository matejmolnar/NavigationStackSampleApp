//
//  OnboardingStep1View.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct OnboardingStep1View: View {
    var body: some View {
        VStack {
            NavigationLink(value: OnboardingRoute.step2) {
                Text("Next")
            }
        }
        .navigationTitle("First Step")
    }
}
