//
//  APODImageService.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 29.06.2022.
//

import Foundation
import SwiftUI

class APODImageService {
        
    private let APODData: Astronomy
    
    init(APODData: Astronomy) {
        self.APODData = APODData
    }
    
    
    func downloadImage() async throws -> UIImage {
        
        guard let unwrappedStringUrl = APODData.photoURL else {
            throw URLError(.badURL)
        }
        guard let url = URL(string: unwrappedStringUrl) else {
            throw URLError(.badURL)
        }
        
        let (data, responce) = try await URLSession.shared.data(from: url)
        
        guard let outputResponce = responce as? HTTPURLResponse,
              outputResponce.statusCode >= 200 && outputResponce.statusCode < 300 else {
                  throw URLError(.badServerResponse)
              }
        
        guard let image = UIImage(data: data) else {
            throw URLError(.cannotCreateFile)
        }
        
        return image

    }
}
