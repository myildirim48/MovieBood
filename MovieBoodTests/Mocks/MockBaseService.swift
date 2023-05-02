//
//  MockBaseService.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 2.05.2023.
//

import XCTest
@testable import MovieBood

final class MockBaseService: BaseServiceProtocol {

    class MockBaseService: BaseServiceProtocol {
        var model: Decodable?
        var requestObject: RequestObject!
        
        init(model: Decodable?) {
            self.model = model
        }
        
        func request<T>(with requestObject: RequestObject, decoder: JSONDecoder, handler: @escaping (Result<T, Error>) -> Void) where T : Decodable {
            if let model = model as? T {
                handler(.success(model))

            }else {
                handler(.failure(AppError.badResponse))
            }
        }
    }

}
