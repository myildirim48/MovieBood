//
//  MovieResults.swift
//  MovieBood
//
//  Created by YILDIRIM on 2.04.2023.
//

import Foundation

struct MoviesModel: Codable,Equatable,MockableModel {
    
    let id: Int
    let posterPath: String?
    
    static func == (lhs:MoviesModel, rhs: MoviesModel)-> Bool {
        return lhs.id == rhs.id
    }
    
    static var mock: MoviesModel {
        return MoviesModel(id: 677179, posterPath: "/9mnXOxmkZSQCHjprx47CnamBEOk.jpg")
    }
    
}
