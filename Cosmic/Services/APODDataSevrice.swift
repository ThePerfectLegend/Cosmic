//
//  NetworkManager.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 28.06.2022.
//

import Foundation

class APODDataSevrice {
        
    func fetchTodayAPODData() async throws -> Astronomy  {
        
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=7mXoJVkuaq26GJAcX1q7QN6whrQC59LeXbUlkKCn")!
        
        guard let todayAPODData = try? await NetworkManager.download(url: url) else {
            throw URLError(.badServerResponse)
        }
        
        guard let astronomy = try? JSONDecoder().decode(Astronomy.self, from: todayAPODData) else {
            throw URLError(.cannotCreateFile)
        }
        
        return astronomy
        
    }
    
    func fetchArrayofAPODData() async throws -> [Astronomy] {
        
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=7mXoJVkuaq26GJAcX1q7QN6whrQC59LeXbUlkKCn&count=50")!
        
        guard let arrayAPODData = try? await NetworkManager.download(url: url) else {
            throw URLError(.badServerResponse)
        }
        
        guard let astronomy = try? JSONDecoder().decode([Astronomy].self, from: arrayAPODData) else {
            throw URLError(.cannotCreateFile)
        }
        
        return astronomy
    }

}
