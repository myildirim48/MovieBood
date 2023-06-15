//
//  MockData.swift
//  MovieBood
//
//  Created by YILDIRIM on 14.06.2023.
//

import Foundation
extension MovieDetailModel {
    static var mock: MovieDetailModel {
        Bundle.main.decode(MovieDetailModel.self, from: "MovieDetail.json")
    }
}
