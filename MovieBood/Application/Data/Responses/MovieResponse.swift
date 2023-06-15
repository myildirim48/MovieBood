//
//  MovieResponse.swift
//  MovieBood
//
//  Created by YILDIRIM on 2.04.2023.
//

import Foundation

struct MovieResponse<T:Codable> : Codable {
    let page: Int?
    let results: [T]
    let totalPages, totalResults: Int?
}
