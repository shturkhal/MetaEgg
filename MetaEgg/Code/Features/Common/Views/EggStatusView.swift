//
//  EggStatusView.swift
//  MetaEgg
//
//  Created by Ivan Shturkhal on 12.03.2026.
//

import SwiftUI

struct EggStatusView: View {
    
    var temperature: Double

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 150, height: 150)
                .shadow(radius: 5)

            Circle()
                .fill(Color.orange)
                .frame(width: 70, height: 70)

            if temperature <= 65 {
                Circle()
                    .fill(Color.gray.opacity(opacityForWhite(from: temperature) * 0.1))
                    .frame(width: sizeForWhiteOverlay(from: temperature),
                           height: sizeForWhiteOverlay(from: temperature))
                    .animation(.easeInOut(duration: 0.4), value: temperature)
            }

            if temperature >= 56 && temperature <= 75 {
                Circle()
                    .fill(Color.gray.opacity(opacityForYolkFade(from: temperature) * 0.2))
                    .frame(width: sizeForYolkFade(from: temperature),
                           height: sizeForYolkFade(from: temperature))
                    .animation(.easeInOut(duration: 0.4), value: temperature)
            }

            if temperature > 75 {
                Circle()
                    .fill(Color.yellow.opacity(opacityForYolkLight(from: temperature)))
                    .frame(width: sizeForYolkLight(from: temperature),
                           height: sizeForYolkLight(from: temperature))
                    .blendMode(.screen)
                    .animation(.easeInOut(duration: 0.4), value: temperature)
            }
        }
    }

    private func opacityForWhite(from temp: Double) -> Double {
        if temp < 56 { return 1.0 }
        if temp > 65 { return 0.0 }
        return 1.0 - (temp - 56) / (65 - 56)
    }

    private func sizeForWhiteOverlay(from temp: Double) -> CGFloat {
        let progress = 1.0 - opacityForWhite(from: temp)
        return 150 * (1.0 - progress)
    }

    private func opacityForYolkFade(from temp: Double) -> Double {
        if temp < 59 { return 1.0 }
        if temp > 75 { return 0.0 }
        return 1.0 - (temp - 59) / (75 - 59)
    }

    private func sizeForYolkFade(from temp: Double) -> CGFloat {
        return 70 * opacityForYolkFade(from: temp)
    }

    private func opacityForYolkLight(from temp: Double) -> Double {
        if temp < 75 { return 0.0 }
        return (temp - 75) / (85 - 75)
    }

    private func sizeForYolkLight(from temp: Double) -> CGFloat {
        return 70 * opacityForYolkLight(from: temp)
    }
}
