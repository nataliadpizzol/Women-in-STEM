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
        Text("We'll implement the details view here!")
    }
}

#Preview {
    ScientistDetailView(
        scientist: ScientistDataLoader.shared.loadScientists().first!
    )
}
