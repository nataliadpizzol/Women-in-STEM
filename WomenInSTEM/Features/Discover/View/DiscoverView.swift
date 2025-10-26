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
                Text("We'll implement the discover view here!")
            }
            .navigationTitle(.discoverLabel)
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
