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
                if viewModel.scientists.isEmpty {
                    ContentUnavailableView(
                        .favoritesEmptyStateTitle,
                        systemImage: "star",
                        description: Text(.favoritesEmptyStateDescription)
                    )
                } else {
                    List {
                        Section {
                            ForEach(viewModel.sortedScientists) { scientist in
                                ListRowView(scientist: scientist)
                                    .onTapGesture {
                                        viewModel.selectScientist(scientist)
                                    }
                            }
                        } header: {
                            SortingButton(sortOrder: $viewModel.sortOrder)
                        }
                    }
                }
            }
            .navigationTitle(.favoritesLabel)
            .navigationDestination(item: $viewModel.selectedScientist) { scientist in
                ScientistDetailView(scientist: scientist)
            }
            .onAppear {
                viewModel.loadFavorites()
            }
        }
    }
}

#Preview {
    FavoritesView()
}
