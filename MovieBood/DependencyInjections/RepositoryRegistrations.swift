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
        Resolver.register { MovieSearchRepository() as MovieSearchRepositoryProtocol }
//        Resolver.register { DetailsRepository() as DetailsRepositoryProtocol }
//        Resolver.register { DiscoverRepository() as DiscoverRepositoryProtocol }
    }
}
