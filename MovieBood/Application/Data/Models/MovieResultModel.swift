//
//  MovieResults.swift
//  MovieBood
//
//  Created by YILDIRIM on 2.04.2023.
//

import Foundation

struct MovieResultModel: Codable,Equatable {
    
    let id: Int
    let originalTitle: String?
    let posterPath, releaseDate: String?
    let voteAverage: Double?

// arning("Tell me master really do i need to use Equatable here
    
    static func == (lhs:MovieResultModel, rhs: MovieResultModel)-> Bool {
        return lhs.id == rhs.id
    }
    
}
