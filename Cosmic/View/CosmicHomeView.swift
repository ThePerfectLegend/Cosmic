//
//  CosmicHomeView.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 09.07.2022.
//

import SwiftUI

struct CosmicHomeView: View {
    var body: some View {
        TabView {
            AstronomyListView()
                .tabItem {
                    Label("Cosmic", systemImage: "list.star")
                }
            AstronomyGridView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark.fill")
                }
        }
    }
}
