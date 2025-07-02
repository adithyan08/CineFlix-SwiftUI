//
//  ChangeImage.swift
//  CineFilx
//
//  Created by adithyan na on 2/7/25.
//

import Foundation
import SwiftUI

struct ImageCarouselView: View {
    let imageUrls: [String]
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(0..<imageUrls.count, id: \.self) { index in
                    AsyncImage(url: URL(string: imageUrls[index])) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(height: 250)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .frame(height: 700)
                                .clipped()
                                .cornerRadius(12)
                                .scaledToFit()
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 250)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .tag(index)
                    .animation(.easeInOut(duration: 0.5), value: currentIndex)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: 650)
            .onReceive(timer) { _ in
                withAnimation {
                    currentIndex = (currentIndex + 1) % imageUrls.count
                }
            }
        }
    }
}
