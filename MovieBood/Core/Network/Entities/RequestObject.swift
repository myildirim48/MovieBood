//
//  RequestObject.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Foundation
import Resolver

struct RequestObject{
    
    var host: String
    var path: String
    var httpMethod: HTTPMethod
    var parameters: [String:String]
    var headers: [String:String]
    var httpBody: Data?
    
    public init(host: String, path: String,
                httpMethpd: HTTPMethod = .get,
                parameters: [String:String] = [:],
                headers: [String:String] = [:]){
        self.host = host
        self.path = path
        self.httpMethod = httpMethpd
        self.parameters = parameters
        self.headers = headers
    }
    
    private var endpointComponents: URLComponents{
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        if !parameters.isEmpty{
            components.setQueryItems(with: parameters)
        }
        return components
    }
    
    public func getURLRequest() throws -> URLRequest{
        guard let url = endpointComponents.url else {
            throw AppError.invalidUrlRequest
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.description
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = httpBody
        return urlRequest
    }
}
