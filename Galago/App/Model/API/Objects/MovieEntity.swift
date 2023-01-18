//
//  MovieEntity.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-05.
//

import Foundation

struct MovieEntity: Codable {
    var created: Date
    var updated: Date
    var id: UInt
    var lockType: LockTypeEnum
    var title: String
    var files: [VideoEntity]
    var primaryImage: ImageEntity
    var otherImages: [ImageEntity]
    var trailer: VideoEntity
    var otherVideos: [VideoEntity]
    var subtitles: [SubtitleEntity]
    var releaseDate: String
    var runtime: UInt
    var mpaaRating: MPAARatingEnum
    var userRating: UInt
    var genre: MovieGenreEnum
    var directors: [PersonEntity]
    var writers: [PersonEntity]
    var cast: [PersonEntity]
    var productionCompany: [CompanyEntity]
    var storyLine: String
    var languages: String
    var budget: UInt
    var americasGross: UInt
    var worldWideGross: UInt
    var americasOpeningWeekend: UInt
    var aspectRatio: String
    var countryOfOrigin: CountryEnum
    var views: UInt64
}
