//
//  AstronomyFeed.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 08.06.2022.
//

import Foundation

@MainActor class AstronomyViewModel: ObservableObject {
    
    @Published var astronomies = [Astronomy]()
    
    private let networkManager = NetworkManager.instance
    
    init() {
        Task {
           await loadNewAstronomyData()
        }
    }
    
    public func loadNewAstronomyData() async {
        try? await self.astronomies = loadAstronomyData(number: 25)
    }
    
    public func loadAdditionalAstronomyData() async {
        try? await self.astronomies += loadAstronomyData(number: 15)
    }
    
    private func loadAstronomyData(number: Int) async throws -> [Astronomy] {
        
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=7mXoJVkuaq26GJAcX1q7QN6whrQC59LeXbUlkKCn&count=\(number)")!
        
        guard let astronomyData = try? await networkManager.download(url: url) else {
            throw URLError(.badServerResponse)
        }
        
        guard let astronomy = try? JSONDecoder().decode([Astronomy].self, from: astronomyData) else {
            throw URLError(.cannotCreateFile)
        }
        
        return astronomy
    }
}
