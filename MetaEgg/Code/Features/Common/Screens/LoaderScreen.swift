//
//  LoaderScreen.swift
//  MetaEgg
//
//  Created by Ivan Shturkhal on 12.03.2026.
//

import SwiftUI

struct LoaderScreen: View {
    
    var body: some View {
            VStack {
                Spacer()
                Text("Golden Chicken\nEggs Boil")
                    .font(.suraBold(size: 28))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                RotatingAnimationView(imageName: "goldenEggIcon")
                    .padding()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.purpleMain.ignoresSafeArea())
    }
}
