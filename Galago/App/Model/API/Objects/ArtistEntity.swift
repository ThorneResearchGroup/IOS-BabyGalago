//
//  ArtistEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct ArtistEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var name: String?
    var primaryImage: ImageEntity?
    var otherImages: [ImageEntity]?
    var members: [PersonEntity]?
    var albums: [AlbumEntity]?
    var views: UInt64?
}
