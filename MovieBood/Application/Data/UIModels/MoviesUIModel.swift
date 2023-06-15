//
//  MovieResultUIModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 2.04.2023.
//

import Foundation
struct MoviesUIModel: Identifiable,Equatable{

    let id = UUID()
    let movieID: Int
    let fetchedDataType: FetchedDataType?
    let posterPath: String?
    
    var returnImgURL: String {
        return AppConfig.imageURL + (posterPath ?? "")
}
    
}

extension MoviesUIModel {

    static func convert(from responseModelArr: [MoviesModel], dataType: FetchedDataType) -> [MoviesUIModel] {
        return responseModelArr.map { responseModel in
            
            return MoviesUIModel(movieID: responseModel.id, fetchedDataType: dataType ,posterPath: responseModel.posterPath)
        }
    }
}
