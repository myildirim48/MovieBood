//
//  MovieDetailRemoteService.swift
//  MovieBood
//
//  Created by YILDIRIM on 7.04.2023.
//

import Foundation
protocol MovieDetailRemoteServiceProtocol {
    
    func getMovieDetail(movieID: String,
                             handler: @escaping (Result<MovieDetailModel, Error>) -> Void)
    
    func fetchReviews(movieID:String,
                    page: String,
                    handler: @escaping(Result<MovieResponse<MovieReviewsModel>,Error>) -> Void)
    
    func fetchPerson(personID: String,
                     handler: @escaping(Result<PersonModel, Error>) -> Void)
    
    func personMovieCredits(personID: String,
                             handler: @escaping(Result<PersonMovieCredits, Error>) -> Void)
    
}

final class MovieDetatilRemoteService: MovieDetailRemoteServiceProtocol,Requestable {

    typealias TargetEndPoint = MovieEndPoints
    
    func getMovieDetail(movieID: String,
                             handler: @escaping (Result<MovieDetailModel, Error>) -> Void){
        
        var requestObject = TargetEndPoint.detail(id: movieID).commonRequestObject
        requestObject.parameters["append_to_response"] = "videos,credits" //URL params
        request(with: requestObject, completionHandler: handler)
    }
    
    func fetchReviews(movieID: String,
                    page: String,
                    handler: @escaping (Result<MovieResponse<MovieReviewsModel>, Error>) -> Void) {
            
        var requestObject = TargetEndPoint.review(id: movieID).commonRequestObject
        requestObject.parameters["page"] = page
        request(with: requestObject, completionHandler: handler)
        
    }
    
    //MARK: -  Person
    func fetchPerson(personID: String,
                     handler: @escaping (Result<PersonModel, Error>) -> Void) {
        let requestObject = TargetEndPoint.person(id: personID).commonRequestObject
        request(with: requestObject, completionHandler: handler)
    }
    
    func personMovieCredits(personID: String,
                            handler: @escaping(Result<PersonMovieCredits, Error>) -> Void) {
        let requestObject = TargetEndPoint.personMovieCredits(id: personID).commonRequestObject
        request(with: requestObject, completionHandler: handler)
    }
    
}
