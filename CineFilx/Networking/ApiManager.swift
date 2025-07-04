//
//  ApiManager.swift
//  CineFilx
//
//  Created by adithyan na on 3/7/25.
//

import Foundation

enum apiEndpoint: String {
    case upcoming = "/movie/upcoming"
    case topRated = "/movie/top_rated"
    case popular = "/movie/popular"
    case trending = "/trending/movie/day"
    
    func url(apiKey: String) -> URL {
        
        let baseURLString = "https://api.themoviedb.org/3"
        return URL(string: "\(baseURLString)\(self.rawValue)?api_key=\(apiKey)&language=en-US&page=1")!
        
    }
}
    class ApiManager {
        static let shared = ApiManager()
        private init() {}
        
        let apiKey = "bbb24ec1248abc1a77a0db813049d8e5"
        
        func fetchMovies(from endpoint: apiEndpoint) async throws -> [Movies] {
            
            
            
            let url = endpoint.url(apiKey: apiKey)
            
            let (data,_) = try await URLSession.shared.data(from: url)
            
            let decode = try JSONDecoder().decode(MovieResponse.self, from: data)
            
            return decode.results
            
        }
        
    }

