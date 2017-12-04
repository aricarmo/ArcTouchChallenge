//
//  MovieListController.swift
//  Muvy
//
//  Created by Arilson Carmo on 12/3/17.
//  Copyright © 2017 Arilson Carmo. All rights reserved.
//

import UIKit
import Kingfisher

class MovieListController: UITableViewController {
    
    var movies: [Movies] = []
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.getMovies()
    }
    
    func getMovies() {
        MovieServices.getFeaturedMovies(page: page) { (result, error) in
            if result.count > 0 {
                if self.page == 1 {
                   self.movies = result
                } else {
                    self.movies += result
                }
                self.tableView.reloadData()
            }
            
            if error != nil {
                AlertMessage.show(title: "Error", message: "Something error when I've tried to get movie list. Please try again later.", view: self)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieCell
        
        if let url = URL(string: APIInfo.imageURL + self.movies[indexPath.row].poster_path) {
            cell.imgPoster.kf.setImage(with: url)
        }
        cell.lblTitle.text = self.movies[indexPath.row].title
        cell.lblReleaseDate.text = DateHandle.formatDate(self.movies[indexPath.row].release_date)
        cell.lblAvarage.text = String(self.movies[indexPath.row].vote_average)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetails", sender: self.movies[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let md = segue.destination as? MovieDetailController,
                let selectedMovie = sender as? Movies {
                md.movie = selectedMovie
            }
        }
    }
    
    /*
     * Function to implement endless scroll
     */
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if self.movies.count > 0 {
            let offsetY = scrollView.contentOffset.y;
            let contentHeight = scrollView.contentSize.height;
            if (offsetY > contentHeight - (scrollView.frame.size.height - 5))
            {
                self.page = self.page + 1
                self.getMovies()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    @IBAction func reloadData(_ sender: Any) {
        self.page = 1
        self.getMovies()
    }
    
}

