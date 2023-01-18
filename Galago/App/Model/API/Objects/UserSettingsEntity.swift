//
//  UserSettingsEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct UserSettingsEntity: Codable {
    var created: Date?
    var updated: Date?
    var id: UInt64?
    var lockType: LockTypeEnum?
    var interfaceMethod: InterfaceMethodEnum?
    var defaultPlaybackQuality: PlaybackQualityEnum?
    var dispalyMode: DisplayModeEnum?
    var tableShowPoster: Bool?
    var tableShowName: Bool?
    var tableShowRuntime: Bool?
    var tableShowGenre: Bool?
    var tableShowMpaaRating: Bool?
    var tableShowUserRating: Bool?
    var tableShowLangauge: Bool?
    var tableShowReleaseDate: Bool?
    var tableShowActions: Bool?
    var homePageShowNewMovie: Bool?
    var homePageShowNewTvShow: Bool?
    var homePageShowNewGame: Bool?
    var homePageShowNewBook: Bool?
    var homePageShowNewMusic: Bool?
    var homePageShowPopularMovie: Bool?
    var homePageShowPopularTvShow: Bool?
    var homePageShowPopularGame: Bool?
    var homePageShowPopularBook: Bool?
    var homePageShowPopularMusic: Bool?
    var maxSearchResults: UInt?
    var maxBrowseResults: UInt?
    var cardWidth: UInt?
    var stickyTopMenu: Bool?
}
