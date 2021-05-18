//
//  StoryboardName.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 18/05/2021.
//

import Foundation

enum StoryboardName: String {
    
    case main
    case movieDetails

    var fileName: String {
        return self.rawValue.prefix(1).uppercased() + self.rawValue.dropFirst()
    }
}
