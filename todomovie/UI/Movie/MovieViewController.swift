//
//  MovieViewController.swift
//  todomovie
//
//  Created by Deniz Tunç Tuncer on 10/05/2020.
//  Copyright © 2020 Deniz Tunç Tuncer. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    
    @IBOutlet weak var image: UIImageView!
    
    var search: Search? {
        didSet {
            configureView()
//            getMovieDetail()
        }
    }
    
//    private let api = Api()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView()  {
        title = search?.name ?? search?.title
    }
    
    
//    func getMovieDetail() {
//        api.getMovieDetail(movieId: search?.id ?? -1) { result in
//            switch result {
//            case .success(let movie):
//                let url = URL(string: "https://image.tmdb.org/t/p/w300\(movie.posterPath  ?? "")")
//                self.image.kf.setImage(with:  url)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
}
