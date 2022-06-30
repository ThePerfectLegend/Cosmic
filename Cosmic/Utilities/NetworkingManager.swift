//
//  NetworkingManager.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 29.06.2022.
//

import Foundation

class NetworkManager {
    
    static func download(url: URL) async throws -> Data {
        
        let (data, responce) = try await URLSession.shared.data(from: url)
        
        guard let outputResponce = responce as? HTTPURLResponse,
              outputResponce.statusCode >= 200 && outputResponce.statusCode < 300
        else {
            throw URLError(.badServerResponse)
        }
        
        return data
        
    }
}

//let apiKey = "7mXoJVkuaq26GJAcX1q7QN6whrQC59LeXbUlkKCn"
//let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=7mXoJVkuaq26GJAcX1q7QN6whrQC59LeXbUlkKCn")!

// Decoding
//guard let astronomy = try? JSONDecoder().decode(Astronomy.self, from: data) else {
//    throw URLError(.cannotCreateFile)
//}
