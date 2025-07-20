//
//  VideoRepositoryProtocol.swift
//  VideoApp
//
//  Created by Ankit on 20/07/25.
//

import Foundation

protocol VideoRepositoryProtocol {
    func fetchVideos() async throws -> [Video]
}
