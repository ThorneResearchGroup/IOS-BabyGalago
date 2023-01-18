//
//  VideoViewModel.swift
//  Galago
//
//  Created by Inhee Kim on 2022-08-06.
//

import Foundation

final class VideoViewModel: ObservableObject {
    private(set) var videoFile: VideoFile
    
    init(videoFile: VideoFile) {
        self.videoFile = videoFile
    }
    
}


//struct ResponseBody: Decodable {
//
//    var page: Int
//    var perPage: Int
//    var totalResults: Int
//    var url: String
//    var videos: [Video]
//
//}
//
//struct Video: Identifiable, Decodable {
//
//    var id: Int
//    var image: String
//    var name: Int
//    var url: String
//    var director: Director
//    var videoFiles: [VideoFile]
//
//    struct Director: Identifiable, Decodable {
//        var id: Int
//        var name: String
//        var url: String
//    }
//
//    struct VideoFile: Identifiable, Decodable {
//        var id: Int
//        var UUID: Int
//        var quality: String
//        var fileType: String
//        var link: String
//    }
//
//
//}
