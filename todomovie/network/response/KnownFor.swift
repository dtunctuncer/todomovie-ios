//
//  KnownFor.swift
//  todomovie
//
//  Created by Deniz Tunç Tuncer on 09/05/2020.
//  Copyright © 2020 Deniz Tunç Tuncer. All rights reserved.
//

import Foundation

// MARK: - KnownFor
struct KnownFor: Codable {
    let releaseDate: String
    let id, voteCount: Int
    let video: Bool
    let mediaType: String
    let voteAverage: Double
    let title: String
    let genreIDS: [Int]
    let originalTitle, originalLanguage: String
    let adult: Bool
    let backdropPath, overview, posterPath: String

    enum CodingKeys: String, CodingKey {
        case releaseDate = "release_date"
        case id
        case voteCount = "vote_count"
        case video
        case mediaType = "media_type"
        case voteAverage = "vote_average"
        case title
        case genreIDS = "genre_ids"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case adult
        case backdropPath = "backdrop_path"
        case overview
        case posterPath = "poster_path"
    }
}
