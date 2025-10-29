//
//  DiscoverView.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 21/10/25.
//

import SwiftUI

/// The main view for discovering scientists.
struct DiscoverView: View {
    @State private var viewModel = DiscoverViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.scientists) { scientist in
                        ListRowView(
                            name: scientist.name,
                            description: scientist.discipline,
                            image: scientist.imageURL
                        )
                        .onTapGesture {
                            viewModel.selectedScientist = scientist
                        }
                    }
                }
            }
            .navigationTitle("Discover")
            .onAppear {
                if viewModel.scientists.isEmpty {
                    viewModel.loadScientists()
                }
            }
            .navigationDestination(item:  $viewModel.selectedScientist) {
                ScientistDetailView(scientist: $0)
            }
        }
    }
}

#Preview {
    DiscoverView()
}
