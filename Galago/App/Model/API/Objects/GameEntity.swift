//
//  GameEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct GameEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var title: String?
    var description: String?
    var files: [FileEntity]?
    var poster: ImageEntity?
    var otherImages: [ImageEntity]?
    var trailer: VideoEntity?
    var otherVideos: [VideoEntity]?
    var genres: [GameGenreEnum]?
    var esrbRating: ESRBRatingEnum?
    var contentWarnings: [GameContentWarningEnum]?
    var platforms: [GamePlatformEnum]?
    var developers: [CompanyEntity]?
    var publishers: [CompanyEntity]?
    var gameModes: [GameModeEnum]?
    var gameSeries: [GameSeriesEntity]?
    var gameEngine: [GameEngineEntity]?
    var gamePlayerPerspective: [GamePlayerPerspectiveEnum]?
    var gameUserRating: UInt?
    var inAppPurchases: Bool?
    var microTransactions: Bool?
    var expectedCompletionTime: UInt?
    var views: UInt64?
}
