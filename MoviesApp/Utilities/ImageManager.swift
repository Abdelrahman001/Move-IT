//
//  ImageManager.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 19/05/2021.
//

import UIKit

struct ImageManager {
    
    private static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    static func downloadImage(from url: URL, completion: ((UIImage?)->())? = nil) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async() {
                completion?(image)
            }
        }
    }
}
