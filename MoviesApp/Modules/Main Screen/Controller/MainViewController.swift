//
//  ViewController.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 14/05/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var moviesTableView: UITableView!
    let moviesAPI = MoviesAPI()
    var moviesArr = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMoviesTableView()
        getPopularMovies()
    }
    
    func configureMoviesTableView() {
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(UINib(nibName: K.movieCellNibName, bundle: nil), forCellReuseIdentifier: K.moviesTableViewCellID)
    }
    
    func getPopularMovies() {
        self.showSpinner(onView: self.view)
        moviesAPI.getPopularMovies { (moviesList, error) in
            self.removeSpinner()
            if let error = error {
                print("Error Getting Popular Movies \(error)")
            } else {
                if let moviesList = moviesList {
                    self.moviesArr = moviesList.movies
                    self.moviesTableView.reloadData()
                }
            }
        }
    }
}

//MARK:- UITableView Delegate Methods
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushToDetailedViewController(index: indexPath.row)
    }
    
    func pushToDetailedViewController(index: Int) {
        let detailedVC = MovieDetailsViewController.instantiate(storyboardName: .movieDetails)
        detailedVC.modalPresentationStyle = .fullScreen
        detailedVC.movieId = "\(moviesArr[index].id)"
        self.navigationController?.pushViewController(detailedVC, animated: true)
    }
}

//MARK:- UITableView Data Source Methods
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.moviesTableViewCellID) as! MovieTableViewCell
        let movie = self.moviesArr[indexPath.row]
        cell.movieTitle.text = movie.originalTitle
        cell.movieRate.text = "\(movie.voteAverage)"
        cell.movieReleaseDate.text = movie.releaseDate
        if let poster = movie.posterPath {
            if let url =  URL(string: URLs.Path.posterPath(poster).absoluteUrl) {
                ImageManager.downloadImage(from: url) { (image) in
                    cell.moviePoster.image = image
                    cell.layoutIfNeeded()
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
