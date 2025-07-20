//
//  FetchVideosUseCase.swift
//  VideoApp
//
//  Created by Ankit on 20/07/25.
//

import Foundation


class FetchVideosUseCase: FetchVideosUseCaseProtocol {
    private let repository: VideoRepositoryProtocol
    
    init(repository: VideoRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [Video] {
        return try await repository.fetchVideos()
    }
}
