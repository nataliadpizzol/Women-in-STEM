//
//  FavoritesViewModel.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 26/10/25.
//

import Foundation
import SwiftUI

/// The view model managing the favorites data and logic.
@Observable final class FavoritesViewModel {
    var scientists: [Scientist] = []
    var searchText: String = ""
    var sortOrder: SortOrder = .az
    var selectedScientist: Scientist?

    private let dataLoader = ScientistDataLoader.shared
    private let favoritesManager = FavoritesManager.shared
    
    /// Sorted scientists based on the search text and sort order.
    var sortedScientists: [Scientist] {
        let filtered = searchText.isEmpty
            ? scientists
            : scientists.filter { scientist in
                scientist.name.localizedCaseInsensitiveContains(searchText) ||
                scientist.discipline.localizedCaseInsensitiveContains(searchText)
            }

        switch sortOrder {
        case .az:
            return filtered.sorted { $0.name < $1.name }
        case .za:
            return filtered.sorted { $0.name > $1.name }
        }
    }
    
    /// Loads the favorite scientists from the data source.
    func loadFavorites() {
        let allScientists = dataLoader.loadScientists()
        let favoriteIDs = favoritesManager.getFavorites()
        scientists = allScientists.filter { favoriteIDs.contains($0.id) }
    }
    
    /// Selects a scientist to view details.
    /// - Parameter scientist: The scientist to select.
    func selectScientist(_ scientist: Scientist) {
        selectedScientist = scientist
    }
}
