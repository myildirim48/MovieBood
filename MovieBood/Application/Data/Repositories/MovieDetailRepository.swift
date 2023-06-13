//
//  MovieDetailRepository.swift
//  MovieBood
//
//  Created by YILDIRIM on 7.04.2023.
//

import Foundation
import Resolver

protocol MovieDetailRepositoryProtocol{

    var totalPagesofReviews : Int { get }

    func getMvoeiDetail(movieID:String) async throws -> MovieDetailUIModel
        
    func getReviews(movieID:String
                    ,page:String) async throws -> [MovieReviewsUIModel]
    
    func getPerson(personID: String) async throws -> PersonUIModel
    
    func getPersonCredits(personID: String) async throws -> PersonMovieCreditsUIModel
}

final class MovieDetailRepository: MovieDetailRepositoryProtocol {

    @Injected private var service: MovieDetailRemoteServiceProtocol
    
    var totalPagesofReviews: Int = 0
    
    func getMvoeiDetail(movieID: String) async throws -> MovieDetailUIModel {
        let response = try await service.getMovieDetail(movieID: movieID)
        let uiModel = MovieDetailUIModel.convert(from: response)
        return uiModel
    }
    
    func getReviews(movieID: String, page: String) async throws -> [MovieReviewsUIModel] {
        let response = try await service.fetchReviews(movieID: movieID, page: page)
        let uiModel = MovieReviewsUIModel.convert(from: response.results)
        return uiModel
    }
    //MARK: -  Person
    
    
    func getPerson(personID: String) async throws -> PersonUIModel {
        let response = try await service.fetchPerson(personID: personID)
        let uiModel = PersonUIModel.convert(from: response)
        return uiModel
    }
    
    
    func getPersonCredits(personID: String) async throws -> PersonMovieCreditsUIModel {
        let response = try await service.personMovieCredits(personID: personID)
        let uiModel = PersonMovieCreditsUIModel.convert(from: response)
        return uiModel

        }
}
