//
//  BoilStatsManager.swift
//  MetaEgg
//
//  Created by Ivan Shturkhal on 13.03.2026.
//

import SwiftUI

class BoilStatsManager {
    
    static let shared = BoilStatsManager()
    private let keyPrefix = "boilStats_"
    
    func saveBoil(for size: EggSize, time: TimeInterval) {
        let key = keyPrefix + size.rawValue
        var stats = getStats(for: size)
        stats.count += 1
        stats.totalTime += time
        
        if let data = try? JSONEncoder().encode(stats) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    func getStats(for size: EggSize) -> EggBoilStatsModel {
        let key = keyPrefix + size.rawValue
        if let data = UserDefaults.standard.data(forKey: key),
           let stats = try? JSONDecoder().decode(EggBoilStatsModel.self, from: data) {
            return stats
        } else {
            return EggBoilStatsModel(count: 0, totalTime: 0)
        }
    }
}
