//
//  EggBoilStatsModel.swift
//  MetaEgg
//
//  Created by Ivan Shturkhal on 16.03.2026.
//

import SwiftUI

struct EggBoilStatsModel: Codable {
    
    var count: Int
    var totalTime: TimeInterval
    var averageTime: TimeInterval {
        count == 0 ? 0 : totalTime / Double(count)
    }
}
