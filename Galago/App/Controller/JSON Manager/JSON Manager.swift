//
//  JSON Manager.swift
//  Galago
//
//  Created by Inhee Kim on 2022-08-11.
//

import Foundation

struct VideoInfo: Codable {
    var Title: String
    var Description: String
    var Year: Int
    var Director: String
    var videoURL: URL
    var thumbnail_URL: URL
    
//    init() {
//        let json = """
//        {
//            "Title": "Joker",
//            "Description": "A guy that jokes a lot",
//            "Year": 2020,
//            "Director": "lmao",
//            "VideoURL": "www.google.ca",
//            "thumbnail_URL": "www.apple.com"
//
//        }
//        """.data(using: .utf8)
//
//        let decoder = JSONDecoder()
//        let video = try decoder.decode(VideoInfo.self, from: json)
//
//        print(video.title)
//    }
}


    
    

