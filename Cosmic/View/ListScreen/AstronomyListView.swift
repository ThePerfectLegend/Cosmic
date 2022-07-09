//
//  CosmicHomeView.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 08.06.2022.
//

import SwiftUI

struct AstronomyListView: View {
    
    @StateObject var astronomyViewModel = AstronomyViewModel()
    @State private var showDetailView = false
    @State private var selectedAstronomy: Astronomy?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(astronomyViewModel.astronomies) { astronomy in
                    AstronomyRowView(astronomy: astronomy)
                        .onTapGesture {
                            segue(astronomy: astronomy)
                        }
                        .task {
                            if astronomy == astronomyViewModel.astronomies.last {
                                await astronomyViewModel.loadAdditionalAstronomyData()
                            }
                        }
                }
            }
            .navigationTitle("Cosmic")
            .listStyle(.plain)
            .refreshable {
                await astronomyViewModel.loadNewAstronomyData()
            }
            .background(
                NavigationLink(isActive: $showDetailView, destination: {
                    if let unwrappedAstronomy = selectedAstronomy {
                        AstronomyDetailView(astronomy: unwrappedAstronomy)
                    }
                }, label: {
                    EmptyView()
                })
            )
        }
        .environmentObject(astronomyViewModel)
    }
    
    private func segue(astronomy: Astronomy) {
        selectedAstronomy = astronomy
        showDetailView.toggle()
    }
}

