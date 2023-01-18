//
//  CharacterEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct CharacterEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var title: String?
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var birthday: String?
    var alias: String?
    var playedBy: PersonEntity?
    var views: UInt64?
}
