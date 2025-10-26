//
//  TabBarView.swift
//  WomenInSTEM
//
//  Created by Natalia Dal Pizzol on 26/10/25.
//

import SwiftUI

/// The apps' tab bar view.
struct TabBarView: View {
    @State private var selectedTab: Tabs = .discover

    var body: some View {
        Text("Here goes the tab bar!")
    }
}

#Preview {
    TabBarView()
}
