//
//  MoviesRemoteService.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Foundation
protocol SearchServiceProtocol {
    
    func getSearchedItems(queryText:String,
                          page: Int,
                          handler: @escaping (Result<MultiSearchResponse, Error>) -> Void)
}

 final class SearchRemoteService: SearchServiceProtocol,Requestable {
    
    typealias TargetEndPoint = SearchEndPoints
    
    func getSearchedItems(queryText:String,
                          page: Int,
                          handler: @escaping (Result<MultiSearchResponse, Error>) -> Void){
        
        var requestObject = TargetEndPoint.multiSearch.commonRequestObject
        requestObject.parameters["query"] = queryText
        request(with: requestObject, completionHandler: handler)
    }
    
    
   
}
