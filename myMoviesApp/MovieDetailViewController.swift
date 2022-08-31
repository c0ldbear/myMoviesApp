//
//  MovieDetailViewController.swift
//  myMoviesApp
//
//  Created by teddy on 2022-08-31.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movie: MovieData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie {
            let titleLabel = UILabel()
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.text = movie.title
            titleLabel.sizeToFit()
            
            view.addSubview(titleLabel)
            
            //        testLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
            //        testLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
            titleLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        }
        
    }
}
