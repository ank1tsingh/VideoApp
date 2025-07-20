//
//  VideoListView.swift
//  VideoApp
//
//  Created by Ankit on 20/07/25.
//

import SwiftUI

struct VideoListView: View {
    let videos: [Video]
    
    var body: some View {
        LazyVStack(spacing: 16) {
            ForEach(videos) { video in
                VideoRowView(video: video)
            }
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    VideoListView()
//}
