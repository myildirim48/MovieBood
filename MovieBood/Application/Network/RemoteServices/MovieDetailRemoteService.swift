//
//  MovieDetailRemoteService.swift
//  MovieBood
//
//  Created by YILDIRIM on 7.04.2023.
//

import Foundation
protocol MovieDetailRemoteServiceProtocol {
    
    func getMovieDetail(movieID: String) async throws -> MovieDetailModel
    
    func fetchReviews(movieID:String,
                      page: String) async throws -> MovieResponse<MovieReviewsModel>
    
    func fetchPerson(personID: String) async throws -> PersonModel
    
    func personMovieCredits(personID: String) async throws -> PersonMovieCredits
}

final class MovieDetatilRemoteService: MovieDetailRemoteServiceProtocol, Requestable {
    
    typealias TargetEndPoint = MovieEndPoints
    
    func getMovieDetail(movieID: String) async throws -> MovieDetailModel {
        
        var requestObject = TargetEndPoint.detail(id: movieID).commonRequestObject
        
        requestObject.parameters["append_to_response"] = "videos,credits" //URL params
        let response: MovieDetailModel = try await request(with: requestObject)
        return response
    }
    
    func fetchReviews(movieID: String,
                      page: String) async throws -> MovieResponse<MovieReviewsModel> {
        
        var requestObject = TargetEndPoint.review(id: movieID).commonRequestObject
        requestObject.parameters["page"] = page
        let response: MovieResponse<MovieReviewsModel> = try await request(with: requestObject)
        return response
    }
    
    //MARK: -  Person

    func fetchPerson(personID: String) async throws -> PersonModel {
        let requestObject = TargetEndPoint.person(id: personID).commonRequestObject
        let response: PersonModel = try await request(with: requestObject)
        return response
    }
    
    func personMovieCredits(personID: String) async throws -> PersonMovieCredits {
        let requestObject = TargetEndPoint.personMovieCredits(id: personID).commonRequestObject
        let response: PersonMovieCredits = try await request(with: requestObject)
        return response
    }
    
}
