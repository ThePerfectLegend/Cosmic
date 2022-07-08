//
//  Astronomy.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 08.06.2022.
//

import Foundation

// MARK: - API example
//struct WelcomeElement {
//    let date, explanation: String?
//    let hdurl: String?
//    let mediaType, serviceVersion, title: String?
//    let url: String?
//}


struct Astronomy: Identifiable, Codable, Equatable {
    let id = UUID().uuidString
    let date: String
    let title: String
    let description: String
    let photoURL: String
    var isLiked: Bool = false
    let copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case date, title, copyright
        case description = "explanation"
        case photoURL = "url"
    }
}
