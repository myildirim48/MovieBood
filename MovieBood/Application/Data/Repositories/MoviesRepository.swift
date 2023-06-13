//
//  MovieResultRepository.swift
//  MovieBood
//
//  Created by YILDIRIM on 2.04.2023.
//

import Foundation
import Resolver

protocol MoviesRepositoryProtocol {
    
    var totalPages : [FetchedDataType : Int] { get }
    var searchTotalPage: Int {get}
    
    func getMovies(page:Int,
                   endpoint: MoviesListEndPoints,
                   movieListType: FetchedDataType) async throws -> [MoviesUIModel]
    
    func searchMovies(page:Int,
                      searchQuery: String) async throws -> [MovieSearchUIModel]
}

final class MoviesRepository: MoviesRepositoryProtocol {
    var totalPages: [FetchedDataType : Int] = [:]
    var searchTotalPage = 0
    
    @Injected private var service: MoviesRemoteServiceProtocol
    
    func getMovies(page:Int,
                   endpoint: MoviesListEndPoints,
                   movieListType: FetchedDataType) async throws -> [MoviesUIModel] {
        let response = try await service.getMoviesFromRemote(page: page, endpoint: endpoint, movieListType: movieListType)
        let uiModel = MoviesUIModel.convert(from: response.results, dataType: movieListType)
        self.totalPages[movieListType] = response.totalPages
        return uiModel
    }
    
    func searchMovies(page:Int,
                      searchQuery: String) async throws -> [MovieSearchUIModel] {
        let response = try await service.searchMovies(page: page, searchQuery: searchQuery)
        let uiModel = MovieSearchUIModel.convert(from: response.results)
        self.searchTotalPage = response.totalPages ?? 0
        return uiModel
    }
}
