//
//  Scientist.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 23/10/25.
//

import Foundation

/// Model representing a scientist.
struct Scientist: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let discipline: String
    let bio: String
    let quote: String
    let imageURL: String
    
    /// Coding keys used to map the JSON keys to the struct properties.
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case discipline = "Discipline"
        case bio = "Bio"
        case quote = "Quote"
        case imageURL = "ImageURL"
    }

    init(
        id: String = UUID().uuidString,
        name: String,
        discipline: String,
        bio: String,
        quote: String,
        imageURL: String
    ) {
        self.id = id
        self.name = name
        self.discipline = discipline
        self.bio = bio
        self.quote = quote
        self.imageURL = imageURL
    }
}
