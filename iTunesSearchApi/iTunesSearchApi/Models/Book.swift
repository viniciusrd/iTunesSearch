//
//  Book.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 10/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import Foundation
struct Book: Equatable, Codable {
    var artworkUrl60: String?
    var artworkUrl100: String?
    var artistViewUrl: String?
    var trackCensoredName: String?
    var fileSizeBytes: Int?
    var trackViewUrl: String?
    var trackId: Int?
    var trackName: String?
    var formattedPrice: String?
    var genreIds: [String]?
    var artistIds: [Int]?
    var releaseDate: String?
    var currency: String?
    var kind: String?
    var artistId: Int?
    var artistName: String?
    var genres: [String]?
    var price: Double?
    var description: String?
    var averageUserRating: Double?
    var userRatingCount: Int?
    
    enum CondingKeys: String, CodingKey{
        case artworkUrl60  = "artworkUrl60"
        case artworkUrl100 = "artworkUrl100"
        case artistViewUrl = "artistViewUrl"
        case trackCensoredName = "trackCensoredName"
        case fileSizeBytes = "fileSizeBytes"
        case trackViewUrl = "trackViewUrl"
        case trackId = "trackId"
        case trackName = "trackName"
        case formattedPrice = "formattedPrice"
        case genreIds = "genreIds"
        case artistIds = "artistIds"
        case releaseDate = "releaseDate"
        case currency = "currency"
        case kind = "kind"
        case artistId = "artistId"
        case artistName = "artistName"
        case genres = "genres"
        case price = "price"
        case description = "description"
        case averageUserRating = "averageUserRating"
        case userRatingCount = "userRatingCount"
    }
}
