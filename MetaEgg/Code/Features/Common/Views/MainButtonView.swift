//
//  MainButtonView.swift
//  MetaEgg
//
//  Created by Ivan Shturkhal on 12.03.2026.
//

import SwiftUI

struct MainButtonView: View {
    
    var title: LocalizedStringKey
    var backgroundColor: Color
    var titleColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            action()
        }) {
            Text(title)
                .font(.suraBold(size: 28))
                .foregroundColor(titleColor)
                .frame(maxWidth: 200)
                .padding(.vertical, 10)
                .background(backgroundColor)
                .cornerRadius(20)
        }
        .padding(.horizontal, 20)
    }
}
