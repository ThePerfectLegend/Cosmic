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
                ForEach(astronomyViewModel.astronomies) { APOD in
                    AstronomyFeedCard(astronomy: APOD)
                        .listRowSeparator(.hidden)
                        .task {
                            if APOD == astronomyViewModel.astronomies.last {
                                await astronomyViewModel.loadMoreAPODs()
                            }
                        }
                }
            }
            .navigationTitle("Cosmic")
            .listStyle(.plain)
            .refreshable {
                await astronomyViewModel.loadAPODs()
            }
        }
        .environmentObject(astronomyViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CosmicHomeView()
    }
}
