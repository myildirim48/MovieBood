//
//  MovieDetailRemoteService.swift
//  MovieBood
//
//  Created by YILDIRIM on 7.04.2023.
//

import Foundation
protocol MovieDetailRemoteServiceProtocol {
    
    func getMovieDetail(movieID: String,
                             handler: @escaping (Result<MovieDetailModel, Error>) -> Void)
}

final class MovieDetatilRemoteService: MovieDetailRemoteServiceProtocol,Requestable {
    
    typealias TargetEndPoint = MovieEndPoints
    
    func getMovieDetail(movieID: String,
                             handler: @escaping (Result<MovieDetailModel, Error>) -> Void){
        
        let requestObject = TargetEndPoint.detail(id: movieID).commonRequestObject
        request(with: requestObject, completionHandler: handler)
    }
}
