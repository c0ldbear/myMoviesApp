//
//  ApiCaller.swift
//  myMoviesApp
//
//  Created by teddy on 2022-08-31.
//

import Foundation

class ApiCaller {
    
    enum ApiCallerError: Error {
        case invalidURL
        case missingData
    }
    
    var imdbApiUrl: URL? = URL(string: "https://imdb-api.com/en/API/MostPopularMovies/"+apiKey)
    
    func fetch() async throws -> [MovieData] {
        guard let url = imdbApiUrl else {
            throw ApiCallerError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url) // the _ is the http response from URLSession
        
        let imdbResults = try JSONDecoder().decode(IMDBApiResult.self, from: data)
        return imdbResults.items
    }
}
