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
            List {
                Section {
                    ForEach(viewModel.sortedScientists) { s in
                        ListRowView(scientist: s)
                            .onTapGesture { viewModel.selectScientist(s) }
                    }
                } header: {
                    SortingButton(sortOrder: $viewModel.sortOrder)
                }
            }
            .navigationTitle(.discoverLabel)
            .searchable(
                text: $viewModel.searchText,
                prompt: Text(.searchScientists)
            )
            .navigationDestination(item: $viewModel.selectedScientist) {
                ScientistDetailView(scientist: $0)
            }
            .onAppear {
                if viewModel.scientists.isEmpty {
                    viewModel.loadScientists()
                }
            }
        }
    }
}

#Preview {
    DiscoverView()
}
