//
//  PersonMovieCredits.swift
//  MovieBood
//
//  Created by YILDIRIM on 16.04.2023.
//

import Foundation
struct PersonMovieCredits: Codable {
    let cast, crew: [Cast]
    let id: Int
}

// MARK: - Cast
struct Cast: Codable,Identifiable {
    let id: Int
    let posterPath: String?
    
    var imgUrl: String {
        return AppConfig.imageURL + (posterPath ?? " ")
    }
}
