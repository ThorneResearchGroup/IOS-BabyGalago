//
//  VideoEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct VideoEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var title: String?
    var primaryImage: ImageEntity?
    var filePath: String?
    var playbackQualityEnum: PlaybackQualityEnum?
    var views: UInt64?
}
