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
            AsyncImage(url: URL(string: astronomy.photoURL!)) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            HStack {
                Text(astronomy.title!)
                Spacer()
            }
            .padding()
            .background(.thinMaterial)
        }
        .background(.thinMaterial)
        .mask(RoundedRectangle(cornerRadius: 16))
        .padding(.bottom, 8)
    }
}


//Text("Copywrite: \(astronomy.copyright!)")
