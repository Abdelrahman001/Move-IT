//
//  URLs.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 18/05/2021.
//

import Foundation

struct URLs  {
    
    static let apiKey = "750aab8c4cd70e23767053c382faf348"
    static let apiKeyParam = "?api_key=\(URLs.apiKey)"
    
    enum Path {
        case discoverMovie
        case login
        
        var absolutePath: String {
            switch self {
            case .discoverMovie:
                return "/discover/movie\(URLs.apiKeyParam)"
            case .login:
                return "/api/AccountManagement/Login"
            }
        }
    }
}

enum URLEnvironment: String {
    case posterBase
    case base
    
    func getBaseURL() -> String {
        switch self {
        case .posterBase:
            return "https://image.tmdb.org/t/p/w500"
        case .base:
            return "https://api.themoviedb.org/3"
        }
    }
}
