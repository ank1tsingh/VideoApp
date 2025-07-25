//
//  Video.swift
//  VideoApp
//
//  Created by Ankit on 20/07/25.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let title: String
    let thumbnailUrl: String
    let duration: String
    let uploadTime: String
    let views: String
    let author: String
    let videoUrl: String
    let description: String
    let subscriber: String
    let isLive: Bool
}
