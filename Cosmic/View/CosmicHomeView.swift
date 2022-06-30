//
//  CosmicHomeView.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 08.06.2022.
//

import SwiftUI

struct CosmicHomeView: View {
    
    @StateObject var astronomyViewModel = AstronomyViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(astronomyViewModel.astronomies) { POTD in
                    AstronomyFeedCard(astronomy: POTD)
                        .listRowSeparator(.hidden)
                }
            }
            .navigationTitle("Cosmic")
            .listStyle(.plain)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CosmicHomeView()
    }
}
