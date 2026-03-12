//
//  EggSize.swift
//  MetaEgg
//
//  Created by Ivan Shturkhal on 12.03.2026.
//

import SwiftUI

enum EggSize: String, CaseIterable, Identifiable {
    case small = "S"
    case medium = "M"
    case large = "L"
    case extraLarge = "XL"
    
    var id: String { rawValue }
    
    var imageHeight: CGFloat {
        switch self {
        case .small: return 75
        case .medium: return 80
        case .large: return 90
        case .extraLarge: return 100
        }
    }

    var data: EggData {
        switch self {
        case .small: return EggData(weight: 48, calories: 63, image: "sEgg")
        case .medium: return EggData(weight: 58, calories: 77, image: "mEgg")
        case .large: return EggData(weight: 68, calories: 90, image: "lEgg")
        case .extraLarge: return EggData(weight: 78, calories: 105, image: "xlEgg")
        }
    }
    
    struct EggData {
        let weight: Int
        let calories: Int
        let image: String
    }
    
}
