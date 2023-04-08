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
    
    func getMovies(page:Int,
                   endpoint: MoviesListEndPoints,
                   movieListType: FetchedDataType,
                     handler: @escaping (Result<[MoviesUIModel],Error>) -> Void)
}

final class MoviesRepository: MoviesRepositoryProtocol {
    var totalPages: [FetchedDataType : Int] = [:]
    
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
}
