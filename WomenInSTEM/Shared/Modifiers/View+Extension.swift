//
//  View+Extension.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 26/10/25.
//

import SwiftUI

public extension View {
    /// Applies a bottom shadow to the view.
    func bottomShadow() -> some View {
        self
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
    }
    
    /// Applies a gradient overlay to the view.
    func gradientOverlay() -> some View {
        self
            .overlay {
                LinearGradient(
                    colors: [.black.opacity(0.55), .clear],
                    startPoint: .bottom,
                    endPoint: .top
                )
            }
    }
}
