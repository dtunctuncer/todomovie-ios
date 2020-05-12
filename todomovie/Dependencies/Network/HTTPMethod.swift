//
//  HTTPMethod.swift
//  todomovie
//
//  Created by Deniz Tunç Tuncer on 08/05/2020.
//  Copyright © 2020 Deniz Tunç Tuncer. All rights reserved.
//

import Foundation

public extension URLSession {
    enum HTTPMethod: String {
        case get = "GET"
        case patch = "PATCH"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
}
