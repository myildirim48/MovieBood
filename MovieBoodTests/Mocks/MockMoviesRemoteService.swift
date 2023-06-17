//
//  MockMoviesRemoteService.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 15.06.2023.
//

import Foundation
@testable import MovieBood

class MockMoviesRemoteService: MoviesRemoteServiceProtocol {
    
    var moviesModelResponse: MovieResponse<MoviesModel>!
    var moviesSearchResponse: MovieResponse<MovieSearchModel>!
    
    func getMoviesFromRemote(page: Int, endpoint: MoviesListEndPoints, movieListType: FetchedDataType) async throws -> MovieResponse<MoviesModel> {
        return moviesModelResponse
    }
    
    func searchMovies(page: Int, searchQuery: String) async throws -> MovieResponse<MovieSearchModel> {
        return moviesSearchResponse
    }
}
