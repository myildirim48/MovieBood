//
//  MovieDetailRepository.swift
//  MovieBood
//
//  Created by YILDIRIM on 7.04.2023.
//

import Foundation
import Resolver

protocol MoveDetailRepositoryProtocol{
    
    func getMvoeiDetail(movieID:String
                        ,handler: @escaping(Result<MovieDetailUIModel,Error>) -> Void)
}

final class MovieDetailRepository: MoveDetailRepositoryProtocol{

    @Injected private var service: MovieDetailRemoteServiceProtocol
    

    func getMvoeiDetail(movieID: String,
    handler: @escaping (Result<MovieDetailUIModel, Error>) -> Void) {
        
        service.getMovieDetail(movieID: movieID) { result in
            switch result {
            case .success(let movie):
                let uiModel = MovieDetailUIModel.convert(from: movie)
                handler(.success(uiModel))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
    
    
}
