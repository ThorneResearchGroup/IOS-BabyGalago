//
//  TvShowEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct TvShowEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var title: String?
    var description: String?
    var files: [VideoEntity]?
    var showStatus: ShowStatusEnum?
    var firstAired: String?
    var airsOn: String?
    var runtime: UInt?
    var genres: [TvShowGenreEnum]?
    var filmLocation: [LocationEntity]?
    var langauges: String?
    var seasons: [SeasonEntity]?
    var trailer: VideoEntity?
    var otherVideos: [VideoEntity]?
    var primaryImage: ImageEntity?
    var otherImages: [ImageEntity]?
    var views: UInt64?
}
