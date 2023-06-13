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
                             movieListType: FetchedDataType) async throws -> MovieResponse<MoviesModel>
    
    func searchMovies(page:Int,
                      searchQuery: String) async throws -> MovieResponse<MovieSearchModel>
}

final class MoviesRemoteService: MoviesRemoteServiceProtocol,Requestable {
    typealias TargetEndPoint = MovieEndPoints

    
    func getMoviesFromRemote(page: Int, endpoint: MoviesListEndPoints, movieListType: FetchedDataType) async throws -> MovieResponse<MoviesModel> {
        var requestObject = TargetEndPoint.movieListView(ListEndpoint: endpoint).commonRequestObject
        requestObject.parameters["page"] = String(page)
        
        let response: MovieResponse<MoviesModel> = try await request(with: requestObject)
        return response
    }
    
    func searchMovies(page: Int,
                      searchQuery: String) async throws -> MovieResponse<MovieSearchModel> {
        
        var requestObject = TargetEndPoint.search.commonRequestObject
        requestObject.parameters["query"] = searchQuery
        requestObject.parameters["page"] = String(page)

        let response: MovieResponse<MovieSearchModel> = try await request(with: requestObject)
        return response
    }
}

