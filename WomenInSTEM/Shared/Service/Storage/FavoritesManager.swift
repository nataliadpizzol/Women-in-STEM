//
//  FavoritesManager.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 26/10/25.
//

import Foundation

/// Manages the storage and retrieval of favorite scientists using UserDefaults.
final class FavoritesManager {
    /// Singleton instance for global access.
    static let shared = FavoritesManager()

    private let defaults = UserDefaults.standard
    private let favoritesKey = "favoriteScientists"

    private init() {}
    
    /// Retrieves the set of favorite scientist IDs.
    /// - Returns: A set of favorite scientist IDs.
    func getFavorites() -> Set<String> {
        if let array = defaults.stringArray(forKey: favoritesKey) {
            return Set(array)
        }
        return []
    }
    
    /// Checks if a scientist is marked as a favorite.
    /// - Parameter scientistID: The ID of the scientist to check.
    /// - Returns: `true` if the scientist is a favorite, `false` otherwise.
    func isFavorite(_ scientistID: String) -> Bool {
        getFavorites().contains(scientistID)
    }
    
    /// Adds a scientist to the favorites.
    /// - Parameter scientistID: The ID of the scientist to add.
    func addFavorite(_ scientistID: String) {
        var favorites = getFavorites()
        favorites.insert(scientistID)
        saveFavorites(favorites)
    }
    
    /// Removes a scientist from the favorites.
    /// - Parameter scientistID: The ID of the scientist to remove.
    func removeFavorite(_ scientistID: String) {
        var favorites = getFavorites()
        favorites.remove(scientistID)
        saveFavorites(favorites)
    }
    
    /// Saves the set of favorite scientist IDs to UserDefaults.
    /// - Parameter favorites: The set of favorite scientist IDs to save.
    private func saveFavorites(_ favorites: Set<String>) {
        defaults.set(Array(favorites), forKey: favoritesKey)
    }
}
