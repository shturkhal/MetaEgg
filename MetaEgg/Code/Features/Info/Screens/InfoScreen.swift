//
//  InfoScreen.swift
//  MetaEgg
//
//  Created by Ivan Shturkhal on 16.03.2026.
//

import SwiftUI

struct InfoScreen: View {
    
    @Environment(\.dismiss) var dismiss
    let eggItems: [EggSize] = EggSize.allCases
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Text("info")
                    .font(.suraBold(size: 28))
                    .foregroundColor(.white)
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                            .padding(.horizontal, 10)
                    }
                    Spacer()
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(eggItems) { size in
                        let stats = BoilStatsManager.shared.getStats(for: size)
                        InfoCardView(
                            size: size,
                            avgBoilTime: formatTime(stats.averageTime),
                            boiledCount: stats.count
                        )
                    }
                }
            }
            .padding(20)
            Spacer()
        }
        .background(Color.purpleMain.ignoresSafeArea())
        .navigationBarBackButtonHidden()
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
