//
//  String.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 08.07.2022.
//

import Foundation

extension String {
    
    var removingHTMLOccurrences: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
