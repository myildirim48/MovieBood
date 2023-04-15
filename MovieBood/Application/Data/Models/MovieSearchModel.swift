//
//  MovieSearchModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 15.04.2023.
//

import Foundation
struct MovieSearchModel: Codable {
    let id: Int
    let posterPath: String?
    let releaseDate: String?
    let title: String?
}
