//
//  NetworkManager.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 28.06.2022.
//

import Foundation

class APODDataSevrice {
    
    let apiKey = "7mXoJVkuaq26GJAcX1q7QN6whrQC59LeXbUlkKCn"
    let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=7mXoJVkuaq26GJAcX1q7QN6whrQC59LeXbUlkKCn")!
    
    
    func fetchOneAPODData() async throws -> Astronomy  {
        
        // Request
        let (data, responce) = try await URLSession.shared.data(from: url)
        
        // Data
        guard let outputResponce = responce as? HTTPURLResponse,
              outputResponce.statusCode >= 200 && outputResponce.statusCode < 300 else {
                  throw URLError(.badServerResponse)
              }
        
        // Decoding
        guard let astronomy = try? JSONDecoder().decode(Astronomy.self, from: data) else {
            throw URLError(.cannotCreateFile)
        }

        // Instance
        return astronomy
    }
    
    // Fetch Array of APOD Data
    
}
