//
//  QuoteBlock.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 23/10/25.
//

import SwiftUI

/// Stylized quote with a leading rule and author line
struct QuoteBlock: View {
    let quote: String
    let author: String

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 2)
                .fill(.tertiary)
                .frame(width: 3)

            VStack(alignment: .leading, spacing: 8) {
                Text("“\(quote)”")
                    .font(.title3.weight(.semibold))
                    .fixedSize(horizontal: false, vertical: true)
                    .lineSpacing(3)

                Text("—\(author)")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(16)
    }
}

#Preview {
    QuoteBlock(
        quote: "My head is not in the sand. But my thing is, if I can’t work with you, I will work around you. I was not about to be so discouraged that I'd walk away. That may be a solution for some people, but it’s not mine.",
        author: "Annie Easley")
}
