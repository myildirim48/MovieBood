//
//  MovieResultRepository.swift
//  MovieBood
//
//  Created by YILDIRIM on 2.04.2023.
//

import Foundation
import Resolver

protocol MovieResultRepositoryProtocol {
    
    func getMovies(page:Int,
                   endpoint: MoviesListEndPoints,
                   movieListType: FetchedDataType,
                     handler: @escaping (Result<[MovieResultUIModel],Error>) -> Void)
}

final class MovieResultRepository: MovieResultRepositoryProtocol {
    
    @Injected private var service: MoviesRemoteServiceProtocol

    func getMovies(page:Int,
                   endpoint: MoviesListEndPoints,
                   movieListType: FetchedDataType,
                     handler: @escaping (Result<[MovieResultUIModel], Error>) -> Void) {
        #warning("Movie List Type ????")
        service.getMoviesFromRemote(page: page, endpoint: endpoint, movieListType: movieListType) { result in
            switch result{
            case .success(let response):
                let uiModel = MovieResultUIModel.convert(from: response.results, dataType: movieListType)
                handler(.success(uiModel))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
