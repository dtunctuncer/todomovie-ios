//
//  Api.swift
//  todomovie
//
//  Created by Deniz Tunç Tuncer on 06/05/2020.
//  Copyright © 2020 Deniz Tunç Tuncer. All rights reserved.
//

import Foundation

class Api {
    
    private var session: URLSession
    init() {
        let urlSessionConfig = URLSessionConfiguration.ephemeral
        urlSessionConfig.httpAdditionalHeaders = [
            "Content-Type": "application/json"
        ]
        session = URLSession(configuration: urlSessionConfig)
    }
    
    func search(query: String, completion: @escaping (Result<PagingResponse<Search>>) -> Void)  {
        var components = getUrlCompenents()
        components.path = "/3/search/multi"
        let parameters = ["language":"en-US","page":"1","include_adult":"false","query":query]
        components.appendQueryItems(with: parameters)
        session.request(httpmethod: .get, components: components, completion: completion)
    }
    
    func getMovieDetail(movieId: Int, completion: @escaping (Result<Movie>) -> Void)  {
        var components = getUrlCompenents()
        components.path = "/3/movie/\(movieId)"
        session.request(httpmethod: .get, components: components, completion: completion)
    }
    
    private func getUrlCompenents() -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.queryItems = [URLQueryItem(name: "api_key", value: "2473a7ec13996561547478d14431d9bd")]
        return urlComponents
    }
    
}

extension URLComponents {
    mutating func appendQueryItems(with parameters: [String: String]) {
        self.queryItems?.append(contentsOf: parameters.map { URLQueryItem(name: $0.key, value: $0.value) })
    }
    mutating func appendQueryItems(key:String,value:String) {
        self.queryItems?.append(URLQueryItem(name: key, value: value))
    }
}
