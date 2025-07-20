//
//  NetworkError.swift
//  VideoApp
//
//  Created by Ankit on 20/07/25.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case noInternet
    case invalidURL
    case invalidData
    case decodingError
    case serverError
    
    var errorDescription: String? {
        switch self {
        case .noInternet:
            return "No internet connection available"
        case .invalidURL:
            return "Invalid URL"
        case .invalidData:
            return "Invalid data received"
        case .decodingError:
            return "Failed to decode response"
        case .serverError:
            return "Server error occurred"
        }
    }
}
