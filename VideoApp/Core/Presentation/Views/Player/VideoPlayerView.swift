//
//  VideoPlayerView.swift
//  VideoApp
//
//  Created by Ankit on 20/07/25.
//

import SwiftUI


import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @StateObject private var viewModel: VideoPlayerViewModel
    @State private var player: AVPlayer?
    @Environment(\.dismiss) private var dismiss
    
    init(video: Video) {
        self._viewModel = StateObject(wrappedValue: VideoPlayerViewModel(video: video))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let player = player {
                VideoPlayer(player: player)
                    .frame(height: 250)
                    .onAppear {
                        player.play()
                        viewModel.isPlaying = true
                    }
            } else {
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 250)
                    .overlay {
                        ProgressView("Loading video...")
                            .foregroundColor(.white)
                    }
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewModel.video.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        HStack {
                            Text("\(viewModel.video.views) views")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text("•")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text(viewModel.video.uploadTime)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Spacer()
                            
                            if viewModel.video.isLive {
                                Text("LIVE")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(6)
                            }
                        }
                    }
                    
                    Divider()
                    
                    HStack(spacing: 12) {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 40, height: 40)
                            .overlay {
                                Text(String(viewModel.video.author.prefix(1)))
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(viewModel.video.author)
                                .font(.headline)
                                .fontWeight(.medium)
                            
                            Text(viewModel.video.subscriber)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                    }
                    
                    Divider()
                    
                    Text(viewModel.video.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    dismiss()
                }
            }
        }
        .onAppear {
            setupPlayer()
        }
        .onDisappear {
            player?.pause()
        }
    }
    
    private func setupPlayer() {
        guard let url = URL(string: viewModel.video.videoUrl) else { return }
        player = AVPlayer(url: url)
    }
}

//#Preview {
//    VideoPlayerView()
//}
