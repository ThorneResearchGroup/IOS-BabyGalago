//
//  GamePlatformReleaseEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct GamePlatformReleaseEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var playform: GamePlatformEnum?
    var releaseDate: String?
    var views: UInt64?
}
