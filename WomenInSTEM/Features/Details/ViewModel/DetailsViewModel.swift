//
//  DetailsViewModel.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 26/10/25.
//

import Foundation
import SwiftUI

/// ViewModel for managing the scientist details view.
@Observable final class DetailsViewModel {
    var isFavorite: Bool = false

    private let scientist: Scientist
    private let favoritesManager = FavoritesManager.shared

    init(scientist: Scientist) {
        self.scientist = scientist
        checkFavoriteStatus()
    }
    
    /// Checks if the current scientist is marked as a favorite.
    func checkFavoriteStatus() {
        isFavorite = favoritesManager.isFavorite(scientist.id)
    }
    
    /// Toggles the favorite status of the current scientist.
    func toggleFavorite() {
        if isFavorite {
            removeFavorite()
        } else {
            addFavorite()
        }
    }
    
    /// Adds the current scientist to favorites.
    private func addFavorite() {
        favoritesManager.addFavorite(scientist.id)
        withAnimation {
            isFavorite = true
        }
    }
    
    /// Removes the current scientist from favorites.
    private func removeFavorite() {
        favoritesManager.removeFavorite(scientist.id)
        withAnimation {
            isFavorite = false
        }
    }
}
