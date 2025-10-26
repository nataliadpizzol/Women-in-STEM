//
//  ListRowView.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 21/10/25.
//

import SwiftUI

struct ListRowView: View {
    let scientist: Scientist

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: scientist.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 64, height: 64)
            .clipShape(RoundedRectangle(cornerRadius: 16))

            VStack(alignment: .leading) {
                Text(scientist.name)
                    .font(.body)
                    .foregroundStyle(.primary)
                Text(scientist.discipline)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
        }
    }
}


#Preview {
    List {
        if let scientist = ScientistDataLoader.shared.loadScientists().first {
            ListRowView(scientist: scientist)
        }
    }
}
