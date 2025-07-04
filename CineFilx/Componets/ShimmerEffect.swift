//
//  ShimmerEffect.swift
//  CineFilx
//
//  Created by adithyan na on 4/7/25.
//
import SwiftUI
import SwiftUI

struct Shimmer: ViewModifier {
    @State private var phase: CGFloat = 0

    func body(content: Content) -> some View {
        content
            .overlay(
                LinearGradient(gradient: Gradient(colors: [.clear, Color.white.opacity(0.4), .clear]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .rotationEffect(.degrees(30))
                    .offset(x: phase * 300)
                    .blendMode(.plusLighter)
            )
            .mask(content)
            .onAppear {
                withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                    phase = 1
                }
            }
    }
}

extension View {
    func shimmer() -> some View {
        self.modifier(Shimmer())
    }
}

struct ShimmerMoviePlaceholder: View {
    var body: some View {
        HStack(spacing: 16) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 100, height: 150)
                .shimmer()

            VStack(alignment: .leading, spacing: 8) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 20)
                    .shimmer()

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 14)
                    .shimmer()

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 14)
                    .shimmer()
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal)
    }
}

