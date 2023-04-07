//
//  RemoteServiceRegistrations.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Resolver
extension DependencyRegistrationService {
    
    func registerRemoteServices() {
        Resolver.register {
            MoviesRemoteService() as MoviesRemoteServiceProtocol
            Resolver.register {
                MovieDetatilRemoteService() as MovieDetailRemoteServiceProtocol;()
            }
            //        Resolver.register { DiscoverRemoteService() as DiscoverRemoteServiceProtocol }
        }
    }
}
