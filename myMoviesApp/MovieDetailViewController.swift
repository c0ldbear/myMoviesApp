//
//  MovieDetailViewController.swift
//  myMoviesApp
//
//  Created by teddy on 2022-08-31.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movie: MovieData?
    var moviePoster: UIImage?
    var apiCaller: ApiCaller?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie,
           let apiCaller = apiCaller {
            // create label for title
            let title = movie.title
            let titleLabel = UILabel()
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.text = "Title: \(title)"
            titleLabel.sizeToFit()
            
            view.addSubview(titleLabel)
            titleLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
            
            // Create label for year
            let year = movie.year
            let yearLabel = UILabel()
            yearLabel.translatesAutoresizingMaskIntoConstraints = false
            yearLabel.text = "Year: \(year)"
            yearLabel.sizeToFit()
            
            view.addSubview(yearLabel)
            yearLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
            yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
            
            // Create label for imdb rating
            let rating = movie.imDbRating
            let ratingLabel = UILabel()
            ratingLabel.translatesAutoresizingMaskIntoConstraints = false
            ratingLabel.text = "IMDB Rating: \(rating)"
            ratingLabel.sizeToFit()
            
            view.addSubview(ratingLabel)
            ratingLabel.leadingAnchor.constraint(equalTo: yearLabel.leadingAnchor).isActive = true
            ratingLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor).isActive = true
            
            // Create UI image view
            let image = UIImage(systemName: "star.fill")
            Task {
                do {
                    let result: Data? = try await apiCaller.fetch(for: URL(string: movie.image))
                    if let result = result {
                        moviePoster = UIImage(data: result)
                        
                        let imageView = UIImageView(image: moviePoster ?? image)
                        imageView.translatesAutoresizingMaskIntoConstraints = false
                        // Want to change size, how? .sizeToFit() is huge, and sizeThatFit(CGSize()) is also huge...
                        
                        view.addSubview(imageView)
                        imageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
                        imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
                    }
                } catch {
                    print("Error while fetching movie poster.")
                    print(error)
                }
            }
            
        }
        
    }
}
