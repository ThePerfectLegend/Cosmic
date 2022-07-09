//
//  ImageLoadingViewModel.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 09.07.2022.
//

import Foundation
import SwiftUI

class ImageLoadingViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading = false
    
    private let networkManager = NetworkManager.instance
    private let manager = PhotoModelCacheManager.instance
    
    let urlString: String
    
    init(url: String) {
        urlString = url
        getImage()
    }
    
    func getImage() {
        if let cachedImage = manager.get(key: urlString) {
            image = cachedImage
            print("Getting Image from Cache")
        } else {
            Task {
                print("Downloading Image Now")
                try? await downloadImage()
            }
        }
    }
    
    func downloadImage() async throws {
        
        await MainActor.run {
            isLoading = true
        }

        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        guard let fethedData = try? await networkManager.download(url: url) else {
                   throw URLError(.badServerResponse)
               }
        
        guard let image = UIImage(data: fethedData) else {
            throw URLError(.cannotCreateFile)
        }
        
        await MainActor.run {
            self.image = image
            isLoading = false
        }
        
        manager.add(key: self.urlString, value: image)
    }
}
