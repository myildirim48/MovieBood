//
//  MovieResultUIModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 2.04.2023.
//

import Foundation
struct MovieResultUIModel: Identifiable,Equatable{

#warning(" Because of the identifiable without this foreach gives an error")
    let id = UUID()
    
    let movieID: Int
    let fetchedDataType: FetchedDataType?
    let originalTitle: String?
    let posterPath, releaseDate: String?
    let voteAverage: Double?
    
//#warning("Tell me master really do i need to use Equatable here")
//
//    static func == (lhs:MovieResultUIModel, rhs: MovieResultUIModel)-> Bool {
//        return lhs.id == rhs.id
//    }
//
    
    var returnImgURL: String {
        return "https://image.tmdb.org/t/p/w500\(posterPath ?? "/9mnXOxmkZSQCHjprx47CnamBEOk.jpg")"
}
    
}

extension MovieResultUIModel: MockableModel {
    
    static var mock: MovieResultUIModel {
        return MovieResultUIModel(movieID: 123,fetchedDataType: .nowPlaying, originalTitle: "Title Mocek", posterPath: "/9mnXOxmkZSQCHjprx47CnamBEOk.jpg", releaseDate: "30.03.2020", voteAverage: 7.8)
    }
    
    static var mocModelArr: [MovieResultUIModel] = [mock,mock]

    
    static func convert(from responseModelArr: [MovieResultModel], dataType: FetchedDataType) -> [MovieResultUIModel] {
        return responseModelArr.map { responseModel in
            
            return MovieResultUIModel(movieID: responseModel.id, fetchedDataType: dataType , originalTitle: responseModel.originalTitle, posterPath: responseModel.posterPath, releaseDate: responseModel.releaseDate, voteAverage: responseModel.voteAverage)
        }
    }
}
