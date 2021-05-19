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
            if let error = err {
                completion(nil, error)
            } else {
                completion(Movies, nil)
            }
        }
    }
    
    class func getPosterImage (posterPath: String, completionHandler: @escaping (UIImage?, Error?)->Void) {
        guard let url =  URL(string: URLs.Path.posterPath(posterPath).absoluteUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let saveData = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            let image = UIImage(data: saveData)
            DispatchQueue.main.async {
                completionHandler(image, nil)
            }
        }
        task.resume()
    }
}
