//
//  PersonMovieCreditsUIModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 16.04.2023.
//

import Foundation
struct PersonMovieCreditsUIModel: MockableModel,Identifiable {

    private let cast, crew: [Cast]
    let id: Int
    
    var movies: [Cast] {
        return cast + crew
    }
    
    static func convert(from response: PersonMovieCredits) -> PersonMovieCreditsUIModel {
        return PersonMovieCreditsUIModel(cast: response.cast, crew: response.crew, id: response.id)
    }
    
    static var mock: Self {
        return PersonMovieCreditsUIModel(cast: [Cast(id: 502356, posterPath:" /qDRGPAcQoW8Wuig9bvoLpHwf1gU.jpg"),Cast(id: 1234, posterPath:" /qDRGPAcQoW8Wuig9bvoLpHwf1gU.jpg")], crew: [Cast(id: 1234, posterPath:" /qDRGPAcQoW8Wuig9bvoLpHwf1gU.jpg"),Cast(id: 1234, posterPath:" /qDRGPAcQoW8Wuig9bvoLpHwf1gU.jpg")], id: 16483)
    }
}
