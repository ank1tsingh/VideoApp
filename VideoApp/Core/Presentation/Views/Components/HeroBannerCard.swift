//
//  HeroBannerCard.swift
//  VideoApp
//
//  Created by Ankit on 20/07/25.
//

import SwiftUI

struct HeroBannerCard: View {
    let video: Video
    
    var body: some View {
        NavigationLink(destination: VideoPlayerView(video: video)) {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: video.thumbnailUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .overlay {
                            ProgressView()
                        }
                }
                .frame(height: 200)
                .clipped()
                .cornerRadius(12)
                
                LinearGradient(
                    colors: [.clear, .black.opacity(0.7)],
                    startPoint: .center,
                    endPoint: .bottom
                )
                .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(video.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .lineLimit(2)
                    
                    HStack {
                        Text(video.author)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.9))
                        
                        Spacer()
                        
                        Text(video.duration)
                            .font(.caption)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(.black.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(4)
                    }
                }
                .padding()
            }
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.horizontal)
    }
}
