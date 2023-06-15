//
//  MovieSearchModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 15.04.2023.
//

import Foundation
struct MovieSearchModel: Codable, MockableModel {
    let id: Int
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    
    
    static var mock: Self {
        return MovieSearchModel(id: 3124, posterPath: "/qDRGPAcQoW8Wuig9bvoLpHwf1gU.jpg", releaseDate: "30-03-2022", title: "Mock Movie")
    }
}
