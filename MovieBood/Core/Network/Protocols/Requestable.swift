//
//  Requestable.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Foundation
import Resolver

protocol Requestable {
    associatedtype TargetEndPoint: TargetEndpointProtocol
 
    func request<T: Decodable>(baseService: BaseServiceProtocol,
                              with object: RequestObject) async throws -> T
}

extension Requestable {
    
    func request<T: Decodable> (baseService: BaseServiceProtocol = Resolver.resolve(),
                                with object: RequestObject) async throws -> T {
        try await baseService.request(with: object)
    }
}
