//
//  HeroBannerView.swift
//  VideoApp
//
//  Created by Ankit on 20/07/25.
//

import SwiftUI

struct HeroBannerView: View {
    let videos: [Video]
    @State private var currentIndex = 0
    @State private var timer: Timer?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Featured")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            TabView(selection: $currentIndex) {
                ForEach(Array(videos.enumerated()), id: \.element.id) { index, video in
                    HeroBannerCard(video: video)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .frame(height: 220)
            .onAppear {
                startAutoScroll()
            }
            .onDisappear {
                stopAutoScroll()
            }
        }
    }
    
    private func startAutoScroll() {
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                currentIndex = (currentIndex + 1) % videos.count
            }
        }
    }
    
    private func stopAutoScroll() {
        timer?.invalidate()
        timer = nil
    }
}

//
//#Preview {
//    HeroBannerView()
//}
