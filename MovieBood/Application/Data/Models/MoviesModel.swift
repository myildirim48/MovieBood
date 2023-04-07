//
//  MovieResults.swift
//  MovieBood
//
//  Created by YILDIRIM on 2.04.2023.
//

import Foundation

struct MoviesModel: Codable,Equatable {
    
    let id: Int
    let posterPath: String?

// arning("Tell me master really do i need to use Equatable here
    
    static func == (lhs:MoviesModel, rhs: MoviesModel)-> Bool {
        return lhs.id == rhs.id
    }
    
}
