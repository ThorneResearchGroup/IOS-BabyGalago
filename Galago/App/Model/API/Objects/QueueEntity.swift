//
//  QueueEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct QueueEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var status: QueueStateEnum?
    var action: QueueTypeEnum?
    var payload: String?
}
