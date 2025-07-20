//
//  VideoRowView.swift
//  VideoApp
//
//  Created by Ankit on 20/07/25.
//

import SwiftUI


struct VideoRowView: View {
    let video: Video
    
    var body: some View {
        NavigationLink(destination: VideoPlayerView(video: video)) {
            HStack(alignment: .top, spacing: 12) {
                AsyncImage(url: URL(string: video.thumbnailUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .overlay {
                            ProgressView()
                                .scaleEffect(0.8)
                        }
                }
                .frame(width: 120, height: 90)
                .clipped()
                .cornerRadius(8)
                .overlay(alignment: .bottomTrailing) {
                    Text(video.duration)
                        .font(.caption2)
                        .fontWeight(.medium)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .background(.black.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(4)
                        .padding(4)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(video.title)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    Text(video.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        Text(video.author)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        if video.isLive {
                            Text("LIVE")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .padding(.horizontal, 4)
                                .padding(.vertical, 1)
                                .background(.red)
                                .foregroundColor(.white)
                                .cornerRadius(4)
                        }
                    }
                    
                    HStack {
                        Text("\(video.views) views")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text("•")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text(video.uploadTime)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

//
//#Preview {
//    VideoRowView()
//}
