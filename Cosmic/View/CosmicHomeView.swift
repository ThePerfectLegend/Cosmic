//
//  CosmicHomeView.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 08.06.2022.
//

import SwiftUI

struct CosmicHomeView: View {
    
    @StateObject var astronomyViewModel = AstronomyViewModel()
    @State private var showDetailView = false
    @State private var selectedAPOD: Astronomy?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(astronomyViewModel.astronomies) { APOD in
                    AstronomyFeedCard(astronomy: APOD)
                        .onTapGesture {
                            segue(astronomy: APOD)
                        }
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
            .background(
                NavigationLink(isActive: $showDetailView, destination: {
                    if let unwrappedAPOD = selectedAPOD {
                        AstronomyDetailView(astronomy: unwrappedAPOD)
                    }
                }, label: {
                    EmptyView()
                })
            )
        }
        .environmentObject(astronomyViewModel)
    }
    
    private func segue(astronomy: Astronomy) {
        selectedAPOD = astronomy
        showDetailView.toggle()
    }
}

