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
        TabView(selection: $selectedTab) {
            Tab(value: Tabs.discover) {
                DiscoverView()
            } label: {
                Label(Tabs.discover.title,
                      systemImage: Tabs.discover.icon
                )
            }

            Tab(value: Tabs.favorites) {
                FavoritesView()
            } label: {
                Label(Tabs.favorites.title,
                      systemImage: Tabs.favorites.icon
                )
            }
        }
    }
}

#Preview {
    TabBarView()
}
