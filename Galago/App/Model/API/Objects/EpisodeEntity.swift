//
//  EpisodeEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct EpisodeEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var title: String?
    var description: String?
    var poster: ImageEntity?
    var firstAired: String?
    var runtime: UInt64?
    var filmLocations: LocationEntity?
    var languages: String?
    var otherImages: [ImageEntity]?
    var otherVideos: [VideoEntity]?
}
