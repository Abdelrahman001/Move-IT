//
//  MovieTableViewCell.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 18/05/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
