//
//  PersonMovieCreditsUIModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 16.04.2023.
//

import Foundation
struct PersonMovieCreditsUIModel: Identifiable {

    private let cast, crew: [Cast]
    let id: Int
    
    var movies: [Cast] {
        return cast + crew
    }
    
    static func convert(from response: PersonMovieCredits) -> PersonMovieCreditsUIModel {
        return PersonMovieCreditsUIModel(cast: response.cast, crew: response.crew, id: response.id)
    }

}
