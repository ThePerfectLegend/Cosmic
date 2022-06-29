//
//  AstronomyFeedCard.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 08.06.2022.
//

import SwiftUI

struct AstronomyFeedCard: View {
    
    let astronomy: Astronomy
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(astronomy.photoURL!)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
            VStack(alignment: .leading) {
                Text(astronomy.title!)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("Copywrite: \(astronomy.copyright!)")
                    .font(.callout)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(.ultraThinMaterial)
        }
        .mask(RoundedRectangle(cornerRadius: 4, style: .continuous))
        .padding(.horizontal, 12)
    }
}
