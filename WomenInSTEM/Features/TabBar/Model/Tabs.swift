//
//  Tabs.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 26/10/25.
//

import SwiftUI

/// The different tabs available in the app's tab bar.
enum Tabs: Equatable, Hashable, Identifiable {
    case discover
    case favorites
    
    /// The unique identifier for each tab.
    var id: Self { self }
    
    /// The localized title for each tab.
    var title: LocalizedStringResource {
        switch self {
        case .discover:
            .discoverLabel
        case .favorites:
            .favoritesLabel
        }
    }
    
    /// The icon name for each tab.
    var icon: String {
        switch self {
        case .discover:
            "atom"
        case .favorites:
            "star.fill"
        }
    }
}
