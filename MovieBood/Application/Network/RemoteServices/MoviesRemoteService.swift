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
                          handler: @escaping (Result<MovieResponse<MoviesModel>, Error>) -> Void)
    func searchMovies(page:Int,
                      searchQuery: String,
                      handler: @escaping(Result<MovieResponse<MovieSearchModel>, Error>) -> Void)
}

final class MoviesRemoteService: MoviesRemoteServiceProtocol,Requestable {
    typealias TargetEndPoint = MovieEndPoints

     func getMoviesFromRemote(page: Int,
                              endpoint: MoviesListEndPoints,
                              movieListType: FetchedDataType,
                          handler: @escaping (Result<MovieResponse<MoviesModel>, Error>) -> Void){
        
         var requestObject = TargetEndPoint.movieListView(ListEndpoint: endpoint).commonRequestObject
         requestObject.parameters["page"] = String(page)
        request(with: requestObject, completionHandler: handler)
    }

    func searchMovies(page: Int,
                      searchQuery: String,
                      handler: @escaping (Result<MovieResponse<MovieSearchModel>, Error>) -> Void) {
        
        var requestObject = TargetEndPoint.search.commonRequestObject
        requestObject.parameters["query"] = searchQuery
        requestObject.parameters["page"] = String(page)
        request(with: requestObject, completionHandler: handler)
    }
}

