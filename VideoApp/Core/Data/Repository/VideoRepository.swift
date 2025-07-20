//
//  VideoRepository.swift
//  VideoApp
//
//  Created by Ankit on 20/07/25.
//

import Foundation

class VideoRepository: VideoRepositoryProtocol {
    private let urlSession: URLSession
    private let apiURL = "https://gist.githubusercontent.com/poudyalanil/ca84582cbeb4fc123a13290a586da925/raw/videos.json"
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func fetchVideos() async throws -> [Video] {
        guard let url = URL(string: apiURL) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await urlSession.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw NetworkError.serverError
            }
            
            let videos = try JSONDecoder().decode([Video].self, from: data)
            return videos
        } catch is DecodingError {
            throw NetworkError.decodingError
        } catch {
            throw NetworkError.noInternet
        }
    }
}
