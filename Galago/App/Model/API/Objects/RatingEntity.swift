//
//  RatingEnttiy.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct RatingEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var user: UInt64?
    var mediaType: MediaTypeEnum?
    var mediaId: UInt64?
    var value: UInt?
    var views: UInt64?
}
