//
//  ViewController.swift
//  myMoviesApp
//
//  Created by teddy on 2022-08-31.
//

import UIKit

class TableViewController: UITableViewController {

    private var movies  = [String]()
    private var apiCaller = ApiCaller()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movies"
        
        Task {
            do {
                let result = try await apiCaller.fetch()
                for movie in result {
                    movies.append(movie.title)
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
        content.text = movies[indexPath.row]
        content.imageProperties.tintColor = .tintColor
        
        cell.contentConfiguration = content
        
        return cell
    }
    
}

