//
//  MovieDetailController.swift
//  Muvy
//
//  Created by Arilson Carmo on 12/3/17.
//  Copyright © 2017 Arilson Carmo. All rights reserved.
//

import UIKit
import Kingfisher
import Cosmos

class MovieDetailController : UIViewController {
    
    @IBOutlet weak var imgBackdrop: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var avgCircle: UIView!
    @IBOutlet weak var lblAvarage: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    
    var movie: Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let url = URL(string: APIInfo.imageURL + movie!.backdrop_path) {
            self.imgBackdrop.kf.setImage(with: url)
        }
        
        if let url = URL(string: APIInfo.imageURL + movie!.poster_path) {
            self.imgPoster.kf.setImage(with: url)
        }
        self.lblReleaseDate.text = "Release Date: " + DateHandle.formatDate((self.movie?.release_date)!)
        self.lblTitle.text = self.movie?.title
        self.lblOverview.text = self.movie?.overview
        self.avgCircle.layer.cornerRadius = self.avgCircle.frame.width / 2
        self.lblAvarage.text = String(self.movie!.vote_average)
    }
}
