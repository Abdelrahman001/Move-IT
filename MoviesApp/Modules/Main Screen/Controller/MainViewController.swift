//
//  ViewController.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 14/05/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMoviesTableView()
    }
    
    func configureMoviesTableView() {
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(UINib(nibName: K.movieCellNibName, bundle: nil), forCellReuseIdentifier: K.moviesTableViewCellID)
    }
}

//MARK:- UITableView Delegate Methods
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedVC = MovieDetailsViewController.instantiate(storyboardName: .movieDetails)
        detailedVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(detailedVC, animated: true)
    }
}

//MARK:- UITableView Data Source Methods
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.moviesTableViewCellID) as! MovieTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
