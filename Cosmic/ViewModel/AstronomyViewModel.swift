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
//            try? await self.astronomies.append(networkManager.fetchTodayAPODData())
            try? await self.astronomies = networkManager.fetchArrayofAPODData()
        }
    }
}
