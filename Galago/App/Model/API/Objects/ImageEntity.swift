//
//  ImageEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct ImageEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var title: String?
    var file: FileEntity?
    var description: String?
    var views: UInt64?
}
