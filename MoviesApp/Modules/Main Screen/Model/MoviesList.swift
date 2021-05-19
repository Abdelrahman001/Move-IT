//
//  MoviesList.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 19/05/2021.
//

import Foundation

struct MoviesList: Codable {
    let page: Int
    let results: [Movie]
    let totalResults, totalPages: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

// MARK: - Result
struct Movie: Codable {
    let posterPath: String?
    let adult: Bool
    let overview, releaseDate: String
    let movieId: Int
    let originalTitle: String
    let title: String
    let backdropPath: String?
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult, overview
        case releaseDate = "release_date"
        case movieId
        case originalTitle = "original_title"
        case title
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
    }
}
