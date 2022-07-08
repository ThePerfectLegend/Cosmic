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
        if let url = URL(string: astronomy.photoURL) {
            ZStack(alignment: .bottomLeading) {
                CacheAsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                    case .empty:
                        ZStack {
                            Color.clear
                            ProgressView()
                        }
                        .aspectRatio(1, contentMode: .fill)
                    case .failure:
                        VStack {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.red)
                            Text("Can't load image")
                        }
                        .aspectRatio(1, contentMode: .fill)
                    @unknown default:
                        VStack {
                            Image(systemName: "exclamationmark.triangle")
                                .foregroundColor(.yellow)
                            Text("Oops something goes wrong")
                        }
                        .aspectRatio(1, contentMode: .fill)
                    }
                }
                HStack {
                    Text(astronomy.title)
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
}
