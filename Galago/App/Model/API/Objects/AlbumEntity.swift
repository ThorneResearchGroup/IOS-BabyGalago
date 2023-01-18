//
//  AlbumEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-04.
//

import Foundation

struct AlbumEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var name: String?
    var poster: ImageEntity?
    var otherImages: [ImageEntity]?
    var releaseDate: String?
    var artists: [ArtistEntity]?
    var song: [SongEntity]?
    var views: UInt64?
}
