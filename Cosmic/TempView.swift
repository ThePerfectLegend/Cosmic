//
//  TempView.swift
//  Cosmic
//
//  Created by Nizami Tagiyev on 11.06.2022.
//

import SwiftUI

struct TempView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.orange, .yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            Text("Some underlined text")
                .underline()
                .padding()
                .background(Blur(style: .systemUltraThinMaterial))
        }
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

