//
//  MovieCell.swift
//  todomovie
//
//  Created by Deniz Tunç Tuncer on 10/05/2020.
//  Copyright © 2020 Deniz Tunç Tuncer. All rights reserved.
//

import Foundation
import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    
    public func setSearch(search: Search) {
        movieName.text = search.name ?? search.title
        let url = URL(string: "https://image.tmdb.org/t/p/w300\(search.posterPath ?? search.profilePath ?? "")")
        movieImage.kf.setImage(with: url)
    }
}
