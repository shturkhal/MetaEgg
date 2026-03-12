//
//  BoilLevel.swift
//  MetaEgg
//
//  Created by Ivan Shturkhal on 12.03.2026.
//

import SwiftUI

enum BoilLevel: String, CaseIterable, Identifiable {
    
    case liquid
    case soft
    case hard
    
    var id: String { rawValue }
    
    var targetTemp: Double {
        switch self {
        case .liquid: return 63
        case .soft: return 77
        case .hard: return 85
        }
    }
    
    var label: String {
        switch self {
        case .liquid: return "Liquid"
        case .soft: return "Soft"
        case .hard: return "Hard"
        }
    }
}
