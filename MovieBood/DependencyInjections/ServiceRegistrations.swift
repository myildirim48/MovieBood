//
//  ServiceRegistrations.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Foundation
import Resolver

extension DependencyRegistrationService {
    func registerService() {
        Resolver.register { URLSession(configuration: .default) as NetworkLoader }
        Resolver.register { NetworkService() as BaseServiceProtocol}
        Resolver.register {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }
        Resolver.register {
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            return encoder
        }
    }
}
