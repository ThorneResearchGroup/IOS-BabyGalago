//
//  PersonEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct PersonEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var primaryImage: ImageEntity?
    var title: String?
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var birthday: String?
    var birthPlace: LocationEntity?
    var alias: String?
    var views: UInt64?
}
