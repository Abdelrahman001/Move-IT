//
//  MovieDetails.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 19/05/2021.
//

import Foundation

struct MovieDetails: Codable {
    let backdropPath: String?
    let genres: [Genre]
    let originalLanguage, overview: String
    let posterPath: String?
    let runtime: Int
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genres
        case originalLanguage = "original_language"
        case overview
        case posterPath = "poster_path"
        case runtime
    }
}

// MARK: - Genre
struct Genre: Codable {
    let name: String
}

