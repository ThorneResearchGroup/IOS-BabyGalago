//
//  FileEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct FileEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var views: UInt64?
    var path: String?
}
