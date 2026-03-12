//
//  StartBoilViewModel.swift
//  MetaEgg
//
//  Created by Ivan Shturkhal on 12.03.2026.
//

import SwiftUI

class StartBoilViewModel: ObservableObject {
    
    @Published var selectedSize: EggSize = .medium
    @Published var eggTemp: Double = 15
    @Published var boilLevelIndex: Double = 1
    @Published var currentFact: String = ""
    @Published var targetTemp: Double = 70
    
    let levels = BoilLevel.allCases
    
    var boilLevel: BoilLevel {
        levels[Int(boilLevelIndex.rounded())]
    }
    
    let eggFacts: [String] = [
        "Did you know? The average hen lays about 250 to 300 eggs per year.",
        "Brown eggs and white eggs have the same nutritional value.",
        "The largest egg ever laid weighed nearly 1 kilogram!",
        "Fresh eggs sink in water, while older eggs float.",
        "Egg yolks contain more vitamins than egg whites.",
        "The shape of an egg makes it surprisingly strong.",
        "It takes a hen about 24–26 hours to produce an egg.",
        "The color of the eggshell depends on the hen’s breed.",
        "Refrigerated eggs stay fresh for up to 5 weeks.",
        "The yolk color depends on the hen’s diet.",
        "Eggs are one of the best sources of high-quality protein.",
        "Hard boiling an egg makes it easier to peel.",
        "Soft boiled eggs are cooked to about 68°C inside.",
        "Chickens were domesticated over 8,000 years ago.",
        "Eggs contain every vitamin except vitamin C.",
        "In many cultures, eggs symbolize new life and rebirth.",
        "Ancient Romans used crushed eggshells to ward off evil.",
        "Eggs can be used to clarify soups and coffee.",
        "The Guinness record for omelette flipping is over 400 flips in 30 minutes!",
        "The spiral pattern on the yolk is called the chalaza.",
        "An egg’s air cell gets bigger as it ages.",
        "The darker the yolk, the more carotenoids it has.",
        "Eggs are naturally low in calories but rich in nutrients.",
        "Soft boiling takes less time but requires more precision.",
        "Some chickens can lay blue or green eggs!"
    ]
    
    var finalTime: TimeInterval {
        calculateBoilTime(
            size: selectedSize,
            initialTemp: eggTemp,
            targetTemp: targetTemp
        )
    }
    
    var formattedTime: String {
        let minutes = Int(finalTime) / 60
        let seconds = Int(finalTime) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func generateRandomFact() {
        currentFact = eggFacts.randomElement() ?? ""
    }
    
    func calculateBoilTime(size: EggSize, initialTemp: Double, targetTemp: Double) -> TimeInterval {
        let minTargetTemp: Double = 56
        let maxTargetTemp: Double = 85
        let clampedTargetTemp = min(max(targetTemp, minTargetTemp), maxTargetTemp)
        let normalizedTarget = (clampedTargetTemp - minTargetTemp) / (maxTargetTemp - minTargetTemp)
        let minTimeM: TimeInterval = 85
        let maxTimeM: TimeInterval = 484
        let baseTime: TimeInterval = minTimeM + normalizedTarget * (maxTimeM - minTimeM)
        let sizeAdjustment: TimeInterval
        switch size {
        case .small:      sizeAdjustment = -15
        case .medium:     sizeAdjustment = 0
        case .large:      sizeAdjustment = 30
        case .extraLarge: sizeAdjustment = 60
        }
        let tempAdjustment: TimeInterval
        if initialTemp <= 8 {
            tempAdjustment = 40
        } else if initialTemp >= 25 {
            tempAdjustment = 0
        } else {
            let factor = (25 - initialTemp) / 17
            tempAdjustment = factor * 40
        }
        let total = baseTime + sizeAdjustment + tempAdjustment
        return max(total, 0)
    }
}
