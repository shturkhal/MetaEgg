//
//  ContentView.swift
//  MetaEgg
//
//  Created by Ivan Shturkhal on 27.02.2026.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var showLoader = true
    @State private var showOnboarding = false
    
    var body: some View {
        NavigationStack {
            Group {
                if showLoader {
                    LoaderScreen()
                } else if !hasSeenOnboarding && showOnboarding {
                    OnboardingPageView(onFinish: {
                        hasSeenOnboarding = true
                    })
                } else {
                    StartBoilScreen()
                }
            }
            .onAppear {
                requestNotificationPermission()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        showLoader = false
                        showOnboarding = true
                    }
                }
            }
        }
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Notification permission granted")
            } else {
                print("Notification permission denied")
            }
        }
    }
}
