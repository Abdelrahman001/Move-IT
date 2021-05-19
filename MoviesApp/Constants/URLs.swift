//
//  URLs.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 18/05/2021.
//

import Foundation

struct URLs  {
    private static let baseUrl = "https://api.themoviedb.org/3"
    private static let posterBaseUrl = "https://image.tmdb.org/t/p/w500"
    private static let apiKey = "750aab8c4cd70e23767053c382faf348"
    private static let apiKeyParam = "?api_key=\(URLs.apiKey)"
    
    enum Path {
        case discoverPopularMovie
        case posterPath(String)
        
        var absoluteUrl: String {
            switch self {
            case .discoverPopularMovie:
                return "\(URLs.baseUrl)/movie/popular\(URLs.apiKeyParam)"
            case .posterPath(let posterPath):
                return "\(URLs.posterBaseUrl)/\(posterPath)"
            }
        }
    }
}
