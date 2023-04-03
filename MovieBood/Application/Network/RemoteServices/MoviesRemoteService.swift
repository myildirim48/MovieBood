//
//  MoviesRemoteService.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Foundation
protocol MoviesRemoteServiceProtocol {
    
    func getMoviesFromRemote(page: Int,
                             endpoint: MoviesListEndPoints,
                             movieListType: FetchedDataType,
                          handler: @escaping (Result<MovieResponse<MovieResultModel>, Error>) -> Void)
}

 final class MoviesRemoteService: MoviesRemoteServiceProtocol,Requestable {
    
    typealias TargetEndPoint = MovieEndPoints

#warning("Movie List Type ????")
     func getMoviesFromRemote(page: Int,
                              endpoint: MoviesListEndPoints,
                              movieListType: FetchedDataType,
                          handler: @escaping (Result<MovieResponse<MovieResultModel>, Error>) -> Void){
        
         let requestObject = TargetEndPoint.movieListView(ListEndpoint: endpoint).commonRequestObject
        request(with: requestObject, completionHandler: handler)
    }

}

