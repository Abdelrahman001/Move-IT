//
//  MovieDetailsViewController.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 18/05/2021.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var langaugeLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var movieOverView: UITextView!
    
    let movieDetailsAPI = MovieDetailsAPI()
    
    var movieId: String? {
        didSet {
            self.getMovieDetails(movieId: movieId!)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func getMovieDetails(movieId: String) {
        self.showSpinner(onView: self.view)
        movieDetailsAPI.getMovieDetails(movieId: movieId) { (movie, error) in
            self.removeSpinner()
            if error != nil {
                self.movieOverView.text = K.detailsScreenErrorMessage
            } else {
                self.langaugeLabel.text = movie?.originalLanguage
                self.categoryLabel.text = movie?.genres[0].name
                self.movieOverView.text = movie?.overview
                self.splitRunTime(timeInMinutes: movie!.runtime)
                if let poster = movie?.posterPath {
                    if let url =  URL(string: URLs.Path.posterPath(poster).absoluteUrl) {
                        ImageManager.downloadImage(from: url) { (image) in
                            self.posterImageView.image = image
                        }
                    }
                }
            }
        }
    }
    
    func splitRunTime(timeInMinutes: Int) {
        let hours = timeInMinutes / 60
        let minutes = timeInMinutes % 60
        self.durationLabel.text = "\(hours) h \(minutes) m"
    }
}
