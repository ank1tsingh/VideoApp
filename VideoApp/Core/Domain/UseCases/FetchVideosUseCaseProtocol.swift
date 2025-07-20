//
//  FetchVideosUseCaseProtocol.swift
//  VideoApp
//
//  Created by Ankit on 20/07/25.
//

import Foundation

import Foundation

protocol FetchVideosUseCaseProtocol {
    func execute() async throws -> [Video]
}
