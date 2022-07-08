//
//  AstronomyFeed.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 08.06.2022.
//

import Foundation

@MainActor class AstronomyViewModel: ObservableObject {
    
    @Published var astronomies = [Astronomy]()
    
    private let networkManager = APODDataSevrice()
    
    init() {
        Task {
           await loadAPODs()
        }
    }
    
    func loadAPODs() async {
        try? await self.astronomies = networkManager.fetchArrayofAPODData()
    }
    
    func loadMoreAPODs() async {
        do {
            self.astronomies += try await networkManager.fetchArrayofAPODData()
        } catch {
            print("Error in loading more APODs")
        }
    }
}
