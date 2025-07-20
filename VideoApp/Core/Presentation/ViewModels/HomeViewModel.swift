//
//  HomeViewModel.swift
//  VideoApp
//
//  Created by Ankit on 20/07/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    @Published var videos: [Video] = []
    @Published var heroVideos: [Video] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var showError = false
    
    private let fetchVideosUseCase: FetchVideosUseCaseProtocol
    
    init(fetchVideosUseCase: FetchVideosUseCaseProtocol = FetchVideosUseCase(repository: VideoRepository())) {
        self.fetchVideosUseCase = fetchVideosUseCase
    }
    
    func loadVideos() async {
        isLoading = true
        errorMessage = nil
        showError = false
        
        do {
            let fetchedVideos = try await fetchVideosUseCase.execute()
            videos = fetchedVideos
            heroVideos = Array(fetchedVideos.shuffled().prefix(4))
        } catch {
            errorMessage = error.localizedDescription
            showError = true
        }
        
        isLoading = false
    }
    
    func retryLoading() {
        Task {
            await loadVideos()
        }
    }
}
