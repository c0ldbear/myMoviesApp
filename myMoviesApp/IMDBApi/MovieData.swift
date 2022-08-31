//
//  MovieData.swift
//  myMoviesApp
//
//  Created by teddy on 2022-08-31.
//

import Foundation

struct MovieData: Codable  {
    let id: String
    let title: String
    let year: String
    let imDbRating: String
}
