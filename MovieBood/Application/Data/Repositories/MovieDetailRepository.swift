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
    
    var totalPagesofReviews : Int { get }
    
    func getReviews(movieID:String
                    ,page:String,
                    handler: @escaping(Result<[MovieReviewsUIModel], Error>) -> Void)
}

final class MovieDetailRepository: MoveDetailRepositoryProtocol{

    @Injected private var service: MovieDetailRemoteServiceProtocol
    
    var totalPagesofReviews: Int = 0
    
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
    
    func getReviews(movieID: String, page: String, handler: @escaping (Result<[MovieReviewsUIModel], Error>) -> Void) {
        service.fetchReviews(movieID: movieID, page: page) { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    let uiModel = MovieReviewsUIModel.convert(from: success.results)
                    handler(.success(uiModel))
                    self.totalPagesofReviews = success.totalPages ?? 0
                }
            case .failure(let failure):
                handler(.failure(failure))
            }
        }
    }
    
}
