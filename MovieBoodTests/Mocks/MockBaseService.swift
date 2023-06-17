//
//  MockBaseService.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 15.06.2023.
//

import Foundation
@testable import MovieBood

class MockBaseService: BaseServiceProtocol {
    var model: Decodable?
    var requestObject: RequestObject!
    
    init(model: Decodable?) {
        self.model = model
    }
    
    func request<T>(with requestObject: RequestObject, decoder: JSONDecoder) async throws -> T where T : Decodable {
        self.requestObject = requestObject
        
        if let model = model as? T {
            return model
        } else {
            throw AppError.badResponse
        }
    }
}
