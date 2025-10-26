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
        ScrollView {
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
            .gradientOverlay()
            .bottomShadow()

            VStack(spacing: 18) {
                VStack {
                    Text(scientist.name)
                        .font(.largeTitle).bold()

                    Text(scientist.discipline)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                .multilineTextAlignment(.center)

                Text(scientist.bio)
                    .font(.body)

                QuoteBlock(quote: scientist.quote, author: scientist.name)
            }
            .padding(.horizontal, 16)
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                FavoriteButton(isFavorite: viewModel.isFavorite,
                               action: viewModel.toggleFavorite)
            }
        }
    }
}

#Preview {
    ScientistDetailView(
        scientist: ScientistDataLoader.shared.loadScientists().first!
    )
}
