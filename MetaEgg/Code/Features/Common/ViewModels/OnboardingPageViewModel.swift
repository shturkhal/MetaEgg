//
//  OnboardingPageViewModel.swift
//  MetaEgg
//
//  Created by Ivan Shturkhal on 12.03.2026.
//

import SwiftUI

class OnboardingPageViewModel: ObservableObject {
    
    @Published var selectedTabIndex = 0
    
    let pages: [OnboardingPageModel] = [
        OnboardingPageModel(titleText: "Choose Your Egg Size",
                            subtitleText: "Select the size of the egg you are going to boil. You can choose between small, medium, or large eggs. The size affects the cooking time.",
                            pageImage: "onboard1",
                            buttonName: "next"),
        OnboardingPageModel(titleText: "Set the Starting Temperature",
                            subtitleText: "Indicate whether your egg starts at room temperature or from the refrigerator. Cold eggs need a bit more time to cook perfectly.",
                            pageImage: "onboard2",
                            buttonName: "next"),
        OnboardingPageModel(titleText: "Select Yolk Consistency",
                            subtitleText: "Decide how you like your yolk. Soft, Medium, or Hard. The app will calculate the perfect cooking time.",
                            pageImage: "onboard3",
                            buttonName: "next"),
        OnboardingPageModel(titleText: "Start Boiling",
                            subtitleText: "Place the eggs in the pot and start the timer. Watch the progress in real time\non the screen.",
                            pageImage: "onboard4",
                            buttonName: "next"),
        OnboardingPageModel(titleText: "Cool Under Cold Water",
                            subtitleText: "When the timer ends, place the eggs under cold running water. Cooling stops the cooking process and makes peeling easier.",
                            pageImage: "onboard5",
                            buttonName: "start")
    ]
    
    func nextPage() {
        if selectedTabIndex < pages.count - 1 {
            withAnimation(.easeInOut) {
                selectedTabIndex += 1
            }
        }
    }
    
    func closeOnboarding() {
        withAnimation(.easeInOut) {
            selectedTabIndex = pages.count
        }
    }
}

