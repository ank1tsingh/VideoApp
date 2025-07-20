//
//  HomeView.swift
//  VideoApp
//
//  Created by Ankit on 20/07/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                if !viewModel.heroVideos.isEmpty {
                    HeroBannerView(videos: viewModel.heroVideos)
                        .padding(.bottom, 20)
                }
                
                VideoListView(videos: viewModel.videos)
            }
        }
        .navigationTitle("Videos")
        .navigationBarTitleDisplayMode(.large)
        .refreshable {
            await viewModel.loadVideos()
        }
        .overlay {
            if viewModel.isLoading && viewModel.videos.isEmpty {
                LoadingView()
            }
        }
        .alert("Error", isPresented: $viewModel.showError) {
            Button("Retry") {
                viewModel.retryLoading()
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage ?? "An error occurred")
        }
        .task {
            await viewModel.loadVideos()
        }
    }
}


#Preview {
    HomeView()
}
