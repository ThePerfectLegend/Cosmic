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
    let explanation: String
    let photoURL: String
    var isFavorite: Bool = false
    let copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case date, title, copyright, explanation
        case photoURL = "url"
    }
}
