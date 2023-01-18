//
//  SeasonEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct SeasonEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var name: String?
    var primaryImage: ImageEntity?
    var episodeCount: UInt?
    var views: UInt64?
}
