//
//  DetailsView.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 23/10/25.
//

import SwiftUI

/// A view that displays detailed information about a scientist.
struct ScientistDetailView: View {
    @State private var viewModel: DetailsViewModel
    private let scientist: Scientist

    init(scientist: Scientist) {
        self.scientist = scientist
        _viewModel = State(initialValue: DetailsViewModel(scientist: scientist))
    }

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: scientist.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
                    .controlSize(.large)
            }
            .frame(height: 400)
            .frame(maxWidth: .infinity)
            .clipped()

            VStack(spacing: 12) {
                Text(scientist.name)
                    .font(.largeTitle).bold()
                    .foregroundStyle(.primary)

                Text(scientist.discipline)
                    .font(.callout)
                    .foregroundStyle(.secondary)

                Text(scientist.bio)
                    .foregroundStyle(.primary)
            }
            .padding(12)

            Spacer()
        }
        .ignoresSafeArea(edges: .top)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                FavoriteButton(
                    isFavorite: viewModel.isFavorite,
                    action: viewModel.toggleFavorite)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ScientistDetailView(
            scientist: ScientistDataLoader.shared.loadScientists().first!
        )
    }
}
