//
//  AstronomyFeed.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 08.06.2022.
//

import Foundation

@MainActor class AstronomyViewModel: ObservableObject {
    
    @Published var astronomies = [Astronomy]()
    
    let networkManager = APODDataSevrice()
    
    init() {
        Task {
           await loadAPODs()
        }
    }
    
    func loadAPODs() async {
        try? await self.astronomies = networkManager.fetchArrayofAPODData()
    }
}
