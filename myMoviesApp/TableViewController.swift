//
//  ViewController.swift
//  myMoviesApp
//
//  Created by teddy on 2022-08-31.
//

import UIKit

class TableViewController: UITableViewController {

    private var movies  = [MovieData]()
    private var apiCaller = ApiCaller()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movies"
        
        Task {
            do {
                let result = try await apiCaller.fetch()
                for movie in result {
                    movies.append(movie)
                }
                tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movie", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(systemName: "film")
        content.text = movies[indexPath.row].title
        content.imageProperties.tintColor = .tintColor
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "MovieDetail") as? MovieDetailViewController {
            detailViewController.movie = movies[indexPath.row]
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
}

