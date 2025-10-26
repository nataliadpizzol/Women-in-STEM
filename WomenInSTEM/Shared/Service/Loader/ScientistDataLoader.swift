//
//  ScientistDataLoader.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 26/10/25.
//

import Foundation

/// A loader responsible for fetching and decoding scientist data from a JSON file.
final class ScientistDataLoader {
    /// The shared singleton instance of the data loader.
    static let shared = ScientistDataLoader()

    private init() {}
    
    /// Loads scientists from the local JSON dataset.
    /// - Returns: An array of `Scientist` objects sorted by name.
    func loadScientists() -> [Scientist] {
        guard let url = Bundle.main.url(forResource: "Dataset", withExtension: "json") else {
            return []
        }

        guard let data = try? Data(contentsOf: url) else {
            return []
        }

        do {
            let scientists = try JSONDecoder().decode([Scientist].self, from: data)
            return scientists.sorted { $0.name < $1.name }
        } catch {
            if let decodingError = error as? DecodingError {
                switch decodingError {
                case .keyNotFound(let key, let context):
                    print("   Missing key: \(key.stringValue) - \(context.debugDescription)")
                case .typeMismatch(let type, let context):
                    print("   Type mismatch: \(type) - \(context.debugDescription)")
                case .valueNotFound(let type, let context):
                    print("   Value not found: \(type) - \(context.debugDescription)")
                case .dataCorrupted(let context):
                    print("   Data corrupted: \(context.debugDescription)")
                @unknown default:
                    print("   Unknown decoding error")
                }
            }
            return []
        }
    }
}
