//
//  VideoPlayerViewModel.swift
//  VideoApp
//
//  Created by Ankit on 20/07/25.
//

import Foundation

import SwiftUI
import AVKit

@MainActor
class VideoPlayerViewModel: ObservableObject {
    @Published var isPlaying = false
    let video: Video
    
    init(video: Video) {
        self.video = video
    }
}
