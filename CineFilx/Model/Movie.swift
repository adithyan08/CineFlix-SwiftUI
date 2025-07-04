//
//  Movie.swift
//  CineFilx
//
//  Created by adithyan na on 3/7/25.
//

import Foundation



struct MovieResponse: Codable {
    let results: [Movies]
}

struct Movies: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String?
    let release_date: String?
}
