//
//  VideoFile.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-04.
//

import Foundation

struct VideoFile: Identifiable {
    
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let file: String
    let image: String
    
    static let data = VideoFile(title: "Joker", description: "Great movie", duration: 144, file: "Video 1", image:"Thumbnail 1")
}
