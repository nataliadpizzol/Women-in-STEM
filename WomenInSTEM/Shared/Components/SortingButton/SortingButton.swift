//
//  SortingButton.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 26/10/25.
//

import SwiftUI

struct SortingButton: View {
    @Binding var sortOrder: SortOrder

    var body: some View {
        Menu {
            ForEach(SortOrder.allCases) { order in
                Button {
                    sortOrder = order
                } label: {
                    Label(order.rawValue, systemImage: order.icon)
                }
            }
        } label: {
            Label(.sortByNameLabel, systemImage: "chevron.up.chevron.down")
                .font(.headline)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
        }
        .glassEffect()
    }
}

#Preview {
    @Previewable @State var sortOrder: SortOrder = .allCases.first!
    SortingButton(sortOrder: $sortOrder)
}
