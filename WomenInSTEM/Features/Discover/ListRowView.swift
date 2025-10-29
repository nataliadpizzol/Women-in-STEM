//
//  ListRowView.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 29/10/25.
//

import SwiftUI

struct ListRowView: View {
    let name: String
    let description: String
    let image: String

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: image)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 64, height: 64)
            .clipShape(RoundedRectangle(cornerRadius: 16))

            VStack(alignment: .leading) {
                Text(name)
                    .font(.body)
                    .foregroundStyle(.primary)
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
    }
}

#Preview {
    ListRowView(name: "Natalia Dal Pizzol", description: "Cientista da Computação", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Gertrude_Elion.jpg/500px-Gertrude_Elion.jpg")
}
