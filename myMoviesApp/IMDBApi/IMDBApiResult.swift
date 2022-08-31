//
//  IMDBApiResult.swift
//  myMoviesApp
//
//  Created by teddy on 2022-08-31.
//

import Foundation

struct IMDBApiResult: Codable {
    let items: [MovieData]
}
