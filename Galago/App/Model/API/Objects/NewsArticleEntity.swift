//
//  NewsArticleEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct NewsArticleEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var unread: Bool?
    var title: String?
    var preview: String?
    var body: String?
}
