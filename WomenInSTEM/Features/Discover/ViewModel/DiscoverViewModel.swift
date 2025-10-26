//
//  DiscoverViewModel.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 26/10/25.
//

import SwiftUI


/// A view model for managing the state of the Discover view.
@Observable final class DiscoverViewModel {
    var scientists: [Scientist] = []
    var selectedScientist: Scientist?
    var sortOrder: SortOrder = .az
    var searchText: String = ""
    var isSearching: Bool = false
    
    /// Loads the scientists from the data source.
    func loadScientists() {
        scientists = ScientistDataLoader.shared.loadScientists()
    }
    
    /// Selects a scientist to view details.
    /// - Parameter scientist: The scientist to select.
    func selectScientist(_ scientist: Scientist) {
        selectedScientist = scientist
    }
    
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
}
