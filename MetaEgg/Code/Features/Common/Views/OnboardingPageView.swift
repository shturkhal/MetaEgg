//
//  OnboardingPageView.swift
//  MetaEgg
//
//  Created by Ivan Shturkhal on 12.03.2026.
//

import SwiftUI

struct OnboardingPageView: View {
    
    @ObservedObject var onboardingPageViewModel = OnboardingPageViewModel()
    var onFinish: () -> Void
    
    var body: some View {
        TabView(selection: $onboardingPageViewModel.selectedTabIndex) {
            ForEach(0..<onboardingPageViewModel.pages.count, id: \.self) { index in
                let page = onboardingPageViewModel.pages[index]
                
                VStack(spacing: 24) {
                    Spacer()
                    Image(page.pageImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .ignoresSafeArea(edges: .horizontal)
                    
                    VStack(spacing: 12) {
                        Text(page.titleText)
                            .font(.suraBold(size: 26))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                        
                        Text(page.subtitleText)
                            .font(.suraRegular(size: 16))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    
                    MainButtonView(title: page.buttonName,
                                   backgroundColor: .whiteMain,
                                   titleColor: .purpleMain,
                                   action: {
                        if onboardingPageViewModel.selectedTabIndex == onboardingPageViewModel.pages.count - 1 {
                            onboardingPageViewModel.closeOnboarding()
                            onFinish()
                        } else {
                            onboardingPageViewModel.nextPage()
                        }
                    })
                    
                    Spacer()
                }
                .tag(index)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .background(Color.purpleMain.ignoresSafeArea())
    }
}
