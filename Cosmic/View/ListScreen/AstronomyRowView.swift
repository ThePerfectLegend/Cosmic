//
//  AstronomyRowView.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 09.07.2022.
//

import SwiftUI

struct AstronomyRowView: View {
    
    let astronomy: Astronomy
    
    var body: some View {
        HStack(alignment: .top) {
            DownloadingImageView(url: astronomy.photoURL)
                .frame(width: 150, height: 150)
                .aspectRatio(contentMode: .fit)
                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
            VStack(alignment: .leading) {
                Text(astronomy.title)
                    .font(.headline)
                Text(astronomy.date)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

