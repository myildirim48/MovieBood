//
//  PersonMovieCredits.swift
//  MovieBood
//
//  Created by YILDIRIM on 16.04.2023.
//

import Foundation
struct PersonMovieCredits: Codable, MockableModel {
    let cast, crew: [Cast]
    let id: Int
    
    
    static var mock: Self {
        return PersonMovieCredits(cast: [Cast(id: 502356, posterPath:" /qDRGPAcQoW8Wuig9bvoLpHwf1gU.jpg"),Cast(id: 1234, posterPath:" /qDRGPAcQoW8Wuig9bvoLpHwf1gU.jpg")], crew: [Cast(id: 1234, posterPath:" /qDRGPAcQoW8Wuig9bvoLpHwf1gU.jpg"),Cast(id: 1234, posterPath:" /qDRGPAcQoW8Wuig9bvoLpHwf1gU.jpg")], id: 16483)
    }
}

// MARK: - Cast
struct Cast: Codable,Identifiable,Equatable {
    let id: Int
    let posterPath: String?
    
    var imgUrl: String {
        return AppConfig.imageURL + (posterPath ?? " ")
    }
}
