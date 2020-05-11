//
//  URLSession.swift
//  todomovie
//
//  Created by Deniz Tunç Tuncer on 08/05/2020.
//  Copyright © 2020 Deniz Tunç Tuncer. All rights reserved.
//

import Foundation


public extension URLSession {
    enum APIClientError: Error {
        case noData
    }
    
    func request<T: Codable>(httpmethod: HTTPMethod, components: URLComponents, completion: @escaping (Result<T>) -> Void) {
        var url = components
        url.percentEncodedQuery = url.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        var request = URLRequest(url: url.url!)
        request.httpMethod = httpmethod.rawValue
        
        let task = dataTask(with: request) { (data,response,error) in
            DispatchQueue.main.async {
                guard data != nil else {
                    completion(.failure(APIClientError.noData))
                    return
                }
                
                if let error = error {
                    completion(.failure(error))
                    return
                }
            }
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(T.self, from: data)
                    print(response)
                    DispatchQueue.main.async {
                        completion(.success(response))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
                
            }
        }
        task.resume()
    }
}
