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
//    case discover
    
    var path: String {
        
        switch self{
        case .movieListView(ListEndpoint: let movieListEndpoint): return movieListEndpoint.path
//        case .discover(discoverType: let discType, sort: let sort) : return  "/3/\(discType)/\(sort)"
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
enum MoviesListEndPoints {
    case popular
    case nowPlaying
//    case lastest
    case upComing
    case topRated
    
    var path: String {
        
        switch self{
        case .popular: return "/3/movie/popular"
        case .nowPlaying: return "/3/movie/now_playing"
//        case .lastest: return "/3/movie/latest"
        case .upComing: return "/3/movie/upcoming"
        case .topRated: return "/3/movie/top_rated"
        }
        
    }
}
