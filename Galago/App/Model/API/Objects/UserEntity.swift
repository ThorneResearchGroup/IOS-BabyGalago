//
//  UserEntity.swift
//  Galago
//
//  Created by Inhee Kim on 2022-10-05.
//

import Foundation

struct UserEntity: Codable {
    var id: Int
    var permissionGroup: String
    var username: String
    var email: String
    var apiKey: String
}
