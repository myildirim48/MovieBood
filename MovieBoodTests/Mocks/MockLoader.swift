//
//  MockLoader.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 2.05.2023.
//

@testable import MovieBood
import Foundation

final class MockLoader: NetworkLoader {
    
    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?
    
    func load(using request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completion(data,urlResponse,error)
    }
    
    func load(for request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        if let urlResponse = urlResponse {
            completion(data, urlResponse, nil)
        } else if let error = error {
            completion(nil, nil, error)
        } else {
            completion(nil, nil, AppError.badResponse)
        }
    }
    

}
