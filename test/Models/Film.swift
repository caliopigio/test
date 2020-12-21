//
//  Movie.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 20/12/20.
//

import Foundation

struct Film: Decodable {
    
    let identifier: String
    let title: String
    let details: String
    let director: String
    let producer: String
    let releaseYear: String
    let rating: String
    let vehiclesUrl: [URL]
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title = "title"
        case details = "description"
        case director = "director"
        case producer = "producer"
        case releaseYear = "release_date"
        case rating = "rt_score"
        case vehiclesUrl = "vehicles"
    }
}
