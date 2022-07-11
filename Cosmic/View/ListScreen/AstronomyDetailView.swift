//
//  AstronomyDetailView.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 08.07.2022.
//

import SwiftUI

struct AstronomyDetailView: View {
    
    let astronomy: Astronomy
    @State private var showFullDesc = false
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.vertical) {
                VStack {
                    DownloadingImageView(url: astronomy.photoURL)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                        .aspectRatio(1, contentMode: .fit)
                    VStack(spacing: 8) {
                        title
                        copyright
                        date
                        description
                    }
                    .padding(.horizontal, 8)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

extension AstronomyDetailView {
    
    private var title: some View {
        Text(astronomy.title)
            .font(.title2)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var copyright: some View {
        ZStack {
            if let unwrappedCopyright = astronomy.copyright {
                Text("Copyrights: \(unwrappedCopyright)")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    private var date: some View {
        Text(astronomy.date)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var description: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(astronomy.explanation.removingHTMLOccurrences)
                    .lineLimit(showFullDesc ? nil : 3)
                    .font(.body)
                    .animation(showFullDesc ? Animation.easeInOut : .none, value: showFullDesc)
                Button {
                    showFullDesc.toggle()
                } label: {
                    Text(showFullDesc ? "Less" : "Read more...")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .padding(.vertical, 4)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
