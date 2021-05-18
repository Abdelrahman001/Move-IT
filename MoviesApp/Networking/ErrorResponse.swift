//
//  ErrorResponse.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 18/05/2021.
//

import Foundation

struct ErrorResponse: Codable {
    let statusCode: Int
    let statusMessage: String
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
// MARK:- Localized Error Protocol
extension ErrorResponse: LocalizedError {
    var errorDescription: String? {
        return statusMessage
    }
}
