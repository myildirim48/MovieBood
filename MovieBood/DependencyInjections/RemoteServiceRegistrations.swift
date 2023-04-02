//
//  RemoteServiceRegistrations.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Resolver
extension DependencyRegistrationService {
    
    func registerRemoteServices() {
        Resolver.register { SearchRemoteService() as SearchServiceProtocol }
//        Resolver.register { DetailsRemoteService() as DetailsServiceProtocol }
//        Resolver.register { DiscoverRemoteService() as DiscoverRemoteServiceProtocol }
    }
}
