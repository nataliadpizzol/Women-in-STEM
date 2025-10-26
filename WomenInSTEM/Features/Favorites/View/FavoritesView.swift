//
//  FavoritesView.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 23/10/25.
//

import SwiftUI

/// The view displaying the user's favorite scientists.
struct FavoritesView: View {
    @State private var viewModel = FavoritesViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Text("We'll implement the favorites view here!")
            }
            .navigationTitle(.favoritesLabel)
            .onAppear {
                viewModel.loadFavorites()
            }
        }
    }
}

#Preview {
    FavoritesView()
}
