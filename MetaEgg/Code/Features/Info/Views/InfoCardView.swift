//
//  InfoCardView.swift
//  MetaEgg
//
//  Created by Ivan Shturkhal on 16.03.2026.
//

import SwiftUI

struct InfoCardView: View {
    
    let size: EggSize
    let avgBoilTime: String
    let boiledCount: Int

    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Spacer(minLength: 8)
                Image(size.data.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: size.imageHeight)
                Spacer(minLength: 8)
            }
            .frame(height: 120)
            VStack(alignment: .leading, spacing: 5) {
                paramRow(label: "Weight:", value: "\(size.data.weight)g")
                paramRow(label: "Calories:", value: "\(size.data.calories)kcal")
                paramRow(label: "Average boiling\ntime:", value: avgBoilTime)
                paramRow(label: "Number of\nwelded:", value: "\(boiledCount)pcs")
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(maxWidth: 180)
        .frame(height: 270)
        .background(Color.whiteMain)
        .cornerRadius(24)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(.gray.opacity(0.5), lineWidth: 6)
        )
        .padding(.all, 10)
    }

    private func paramRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .font(.suraRegular(size: 12))
                .foregroundColor(.purpleMain)
            Spacer()
            Text(value)
                .font(.suraBold(size: 12))
                .foregroundColor(.purpleMain)
        }
    }
}
