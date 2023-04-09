//
//  RepositoryRegistrations.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Foundation
import Resolver

extension DependencyRegistrationService{
    func registerRepositories(){
        Resolver.register { MoviesRepository() as MoviesRepositoryProtocol }
        Resolver.register { MovieDetailRepository() as MovieDetailRepositoryProtocol }
    }
}
