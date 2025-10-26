//
//  CircleButton.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 23/10/25.
//

import SwiftUI

struct FavoriteButton: View {
    let isFavorite: Bool
    let action: () -> Void

    var body: some View {
        Button {
            withAnimation(.snappy) {
                action()
            }
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
