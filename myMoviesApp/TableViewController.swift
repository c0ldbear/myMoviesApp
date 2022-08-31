//
//  ViewController.swift
//  myMoviesApp
//
//  Created by teddy on 2022-08-31.
//

import UIKit

class TableViewController: UITableViewController {

    private var movies  = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if movies.isEmpty {
            movies.append("Alien")
            movies.append("Aliens")
            movies.append("Predator")
        }
        
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movie", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row] // use 'UIListContentConfiguration' instead
        return cell
    }
    
}

