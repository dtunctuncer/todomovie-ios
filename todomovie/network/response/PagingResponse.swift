//
//  PagingResponse.swift
//  todomovie
//
//  Created by Deniz Tunç Tuncer on 09/05/2020.
//  Copyright © 2020 Deniz Tunç Tuncer. All rights reserved.
//

import Foundation

// MARK: - PagingResponse
struct PagingResponse<T: Codable>: Codable {
    let page, totalResults, totalPages: Int
    let results: [T]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
