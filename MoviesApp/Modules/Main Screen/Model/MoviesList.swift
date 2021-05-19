//
//  MoviesList.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 19/05/2021.
//

import Foundation

struct MoviesList: Codable {
    let page: Int
    let movies: [Movie]
    let totalResults, totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

// MARK: - Result
struct Movie: Codable {
    let posterPath: String?
    let overview, releaseDate: String
    let id: Int
    let originalTitle: String
    let title, backdropPath: String?
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
        case id
        case originalTitle = "original_title"
        case title
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
    }
}
