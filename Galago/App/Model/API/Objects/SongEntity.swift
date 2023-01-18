//
//  SongEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct SongEntity: Codable {
    var created: Date
    var updated: Date
    var id: UInt64
    var lockType: LockTypeEnum
    var title: String
    var file: FileEntity
    var inAlbums: [AlbumEntity]
    var releaseDate: String
    var lyrics: [LyricsEntity]
    var views: UInt64
}
