//
//  Search.swift
//  todomovie
//
//  Created by Deniz Tunç Tuncer on 09/05/2020.
//  Copyright © 2020 Deniz Tunç Tuncer. All rights reserved.
//

import Foundation

// MARK: - Search
struct Search: Codable {
    let knownForDepartment: String?
    let id: Int
    let name: String?
    let knownFor: [KnownFor]?
    let popularity: Double
    let profilePath: String?
    let gender: Int?
    let mediaType: String
    let adult: Bool?
    let voteCount: Int?
    let video: Bool?
    let voteAverage: Double?
    let title, releaseDate, originalLanguage, originalTitle: String?
    let genreIDS: [Int]?
    let backdropPath, overview, posterPath: String?

    enum CodingKeys: String, CodingKey {
        case knownForDepartment = "known_for_department"
        case id, name
        case knownFor = "known_for"
        case popularity
        case profilePath = "profile_path"
        case gender
        case mediaType = "media_type"
        case adult
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
        case title
        case releaseDate = "release_date"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case overview
        case posterPath = "poster_path"
    }
}
