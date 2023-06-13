//
//  BaseServiceProtocol.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Foundation
import Resolver

protocol BaseServiceProtocol {
    
    func request<T: Decodable> (with requestObject: RequestObject,
                              decoder: JSONDecoder) async throws -> T
}

extension BaseServiceProtocol {
    
    func request<T: Decodable> (with requestObject: RequestObject,
                              decoder: JSONDecoder = Resolver.resolve()) async throws -> T {
        try await request(with: requestObject, decoder: decoder)
    }
    
}

