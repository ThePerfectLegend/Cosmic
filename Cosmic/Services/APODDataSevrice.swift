//
//  NetworkManager.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 28.06.2022.
//

import Foundation
import SwiftUI

class APODDataSevrice {
    
    func fetchArrayofAPODData() async throws -> [Astronomy] {
        
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=7mXoJVkuaq26GJAcX1q7QN6whrQC59LeXbUlkKCn&count=25")!
        
        guard let arrayAPODData = try? await NetworkManager.download(url: url) else {
            throw URLError(.badServerResponse)
        }
        
        guard let astronomy = try? JSONDecoder().decode([Astronomy].self, from: arrayAPODData) else {
            throw URLError(.cannotCreateFile)
        }
        
        return astronomy
    }

    func downloadImage(url: String) async throws -> UIImage {
        
        guard let urlFromString = URL(string: url) else {
            throw URLError(.badURL)
        }
        
        guard let imageData = try? await NetworkManager.download(url: urlFromString) else {
            throw URLError(.badServerResponse)
        }
        
        let maybeImage = UIImage(data: imageData)
        
        guard let image = await maybeImage?.thumbnail else {
            throw URLError(.cannotCreateFile)
        }
        
        return image

    }
}
