//
//  Result.swift
//  todomovie
//
//  Created by Deniz Tunç Tuncer on 08/05/2020.
//  Copyright © 2020 Deniz Tunç Tuncer. All rights reserved.
//

import Foundation

public enum Result<T: Codable> {
    case success(T)
    case failure(Error)
}
