//
//  NotificationEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct NotificationEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var userEntity: UInt64?
    var notificationErrorTypeEnum: NotificationErrorTypeEnum?
    var unread: Bool?
    var name: String?
    var body: String?
}
