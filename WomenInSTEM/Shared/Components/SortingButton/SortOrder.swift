//
//  SortOrder.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 26/10/25.
//

import Foundation

enum SortOrder: String, CaseIterable, Identifiable {
    case az = "A–Z"
    case za = "Z–A"

    var id: Self { self }
    var icon: String {
        switch self {
        case .az: return "arrow.down"
        case .za: return "arrow.up"
        }
    }
}
