//
//  MoviesAPI.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 19/05/2021.
//

import UIKit

class MoviesAPI {
    func getPopularMovies(completion: @escaping (MoviesList?, Error?) -> Void) {
        guard let url =  URL(string: URLs.Path.discoverPopularMovie.absoluteUrl) else { return }
        BaseAPI.taskForGetRequest(url: url, response: MoviesList.self) { (Movies, err) in
            DispatchQueue.main.async {
                if let error = err {
                    completion(nil, error)
                } else {
                    completion(Movies, nil)
                }
            }
        }
    }
}
