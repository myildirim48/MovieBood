//
//  MovieSearchUIModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 15.04.2023.
//

import Foundation
struct MovieSearchUIModel: Codable,Identifiable {
    let id: Int
    private let posterPath: String?
    private let releaseDate: String?
    private let title: String?
    
    var imgUrl: String {
        return AppConfig.imageURL + (posterPath ?? "")
    }
    
    var titleUI: String {
        guard let title else { return "n / a"}
        return title
    }
    
    var dateUI: String {
        guard let date = releaseDate?.transformStringToDate().dateToString() else { return "n /a" }
        return date
    }
    
    static func convert(from response: [MovieSearchModel]) -> [MovieSearchUIModel] {
        return response.map { model in
            
            return MovieSearchUIModel(id:model.id, posterPath: model.posterPath, releaseDate: model.releaseDate, title: model.title)
        }
    }

}
