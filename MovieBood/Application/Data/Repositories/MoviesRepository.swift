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
                   movieListType: FetchedDataType,
                     handler: @escaping (Result<[MoviesUIModel],Error>) -> Void)
    
    func searchMovies(page:Int,
                      searchQuery: String,
                      handler: @escaping(Result<[MovieSearchUIModel], Error>) -> Void)
}

final class MoviesRepository: MoviesRepositoryProtocol {
    var totalPages: [FetchedDataType : Int] = [:]
    var searchTotalPage = 0
    
    @Injected private var service: MoviesRemoteServiceProtocol
    
    func getMovies(page:Int,
                   endpoint: MoviesListEndPoints,
                   movieListType: FetchedDataType,
                     handler: @escaping (Result<[MoviesUIModel], Error>) -> Void) {
        service.getMoviesFromRemote(page: page, endpoint: endpoint, movieListType: movieListType) { result in
            switch result{
            case .success(let response):
                DispatchQueue.main.async {
                    let uiModel = MoviesUIModel.convert(from: response.results, dataType: movieListType)
                    self.totalPages[movieListType] = response.totalPages
                    handler(.success(uiModel))
                }

            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
    
    func searchMovies(page:Int,
                      searchQuery: String,
                      handler: @escaping(Result<[MovieSearchUIModel], Error>) -> Void){
        service.searchMovies(page: page, searchQuery: searchQuery) { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    let model = MovieSearchUIModel.convert(from: success.results)
                    self.searchTotalPage = success.totalPages ?? 0
                    handler(.success(model))
                }
            case .failure(let failure):
                handler(.failure(failure))
            }
        }
    }
}
