//
//  NetworkingManager.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 29.06.2022.
//

import Foundation

class NetworkManager {
    
    static let instance = NetworkManager()
    
    private init() { }
        
    func download(url: URL) async throws -> Data {
        let (data, responce) = try await URLSession.shared.data(from: url)
        guard let outputResponce = responce as? HTTPURLResponse,
              outputResponce.statusCode >= 200 && outputResponce.statusCode < 300
        else {
            throw URLError(.badServerResponse)
        }
        return data
    }
}

