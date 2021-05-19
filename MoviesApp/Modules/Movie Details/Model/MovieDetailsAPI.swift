//
//  MovieDetailsAPI.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 19/05/2021.
//

import Foundation

class MovieDetailsAPI {
    
    func getMovieDetails(movieId: String, completion:@escaping (MovieDetails?, Error?) -> Void) {
        guard let url =  URL(string: URLs.Path.movieDetails(movieId).absoluteUrl) else { return }
        BaseAPI.taskForGetRequest(url: url, response: MovieDetails.self) { (Movie, err) in
            DispatchQueue.main.async {
                if let error = err {
                    completion(nil, error)
                } else {
                    completion(Movie, nil)
                }
            }
        }
    }
}
