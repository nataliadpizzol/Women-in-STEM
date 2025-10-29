//
//  FavoriteButton.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 29/10/25.
//

import SwiftUI

struct FavoriteButton: View {
    let isFavorite: Bool
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: isFavorite ? "star.fill" : "star")
                .foregroundStyle(.yellow)
        }
    }
}

#Preview {
    @Previewable @State var isFavorite: Bool = false

    FavoriteButton(isFavorite: isFavorite, action: { isFavorite.toggle() })
}
