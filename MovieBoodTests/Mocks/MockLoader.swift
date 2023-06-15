//
//  MockLoader.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 15.06.2023.
//

import Foundation
@testable import MovieBood

class MockLoader: NetworkLoader {
    
    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?

    func load(using request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completion(data, urlResponse, error)
    }
    
    func load(using request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data?, URLResponse) {
        if let urlResponse = urlResponse {
            return (data, urlResponse)
        } else if let error = error {
            throw error
        } else {
            throw AppError.badResponse
        }
    }
}
