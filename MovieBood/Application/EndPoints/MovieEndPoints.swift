//
//  MovieEndPoints.swift
//  MovieBood
//
//  Created by YILDIRIM on 2.04.2023.
//

import Foundation

enum MovieEndPoints: TargetEndpointProtocol {
    
    
    var base: String{
        AppConfig.baseURL
    }
    
    case movieListView(ListEndpoint: MoviesListEndPoints)
    case detail(id: String)
    case review(id: String)
    case person(id: String)
    case personMovieCredits(id: String)
    case search
    
    var path: String {
        
        switch self{
        case .movieListView(ListEndpoint: let movieListEndpoint): return movieListEndpoint.path
        case .detail(id: let id): return "/3/movie/\(id)"
        case .review(id: let id): return "/3/movie/\(id)/reviews"
        case .person(id: let id): return "/3/person/\(id)"
        case .personMovieCredits(id: let id): return "/3/person/\(id)/movie_credits"
        case .search: return "/3/search/movie"
        }
        
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var commonRequestObject: RequestObject {
        var requestObject = RequestObject(host: base, path: path, httpMethpd: httpMethod)
        requestObject.parameters["api_key"] = AppConfig.apikey
        return requestObject
    }

}

//MARK: -  Endpoint for ListView
enum MoviesListEndPoints: String, CaseIterable{
    case popular
    case nowPlaying
    case upComing
    case topRated
    
    var path: String {
        
        switch self{
        case .popular: return "/3/movie/popular"
        case .nowPlaying: return "/3/movie/now_playing"
        case .upComing: return "/3/movie/upcoming"
        case .topRated: return "/3/movie/top_rated"
        }
        
    }

    var dataType: FetchedDataType {
        .init(rawValue: self.rawValue)!
    }
}
