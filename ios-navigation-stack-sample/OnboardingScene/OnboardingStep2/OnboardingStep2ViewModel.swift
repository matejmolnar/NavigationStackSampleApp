//
//  OnboardingStep2ViewModel.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 20.10.2022.
//

import SwiftUI

class OnboardingStep2ViewModel: ObservableObject {
    @AppStorage("onboardingCompleted") private var onboardingCompleted: Bool = false
    
    func complete() {
        onboardingCompleted = true
    }
}
