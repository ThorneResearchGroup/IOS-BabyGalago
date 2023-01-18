//
//  BookEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct BookEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var poster: ImageEntity?
    var otherImages: [ImageEntity]?
    var title: String?
    var description: String?
    var files: [FileEntity]?
    var pageCount: UInt?
    var authors: [PersonEntity]?
    var views: UInt64?
}
