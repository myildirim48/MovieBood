//
//  AppConfig.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Foundation
enum AppEnvironment {
    case development
    case staging
    case production
}

final class AppConfig {
    
    static var apikey = "249671eff0295b9410c95cbf7aabbef4"
    
    static var configuration: AppEnvironment {
        #if DEVELOPMENT
        return .development
        #elseif PRODUCTION
        return .production
        #else
        return .staging
        #endif
    }
    
    static var baseURL: String {
        switch configuration {
        case .development:
            return "api.themoviedb.org"
        case .staging:
            return "api.themoviedb.org"
        case .production:
            return "api.themoviedb.org"
        }
    }
    
    static var imageURL: String {
        switch configuration {
        case .development:
            return "image.tmdb.org/t/p/w500/"
        case .staging:
            return "image.tmdb.org/t/p/w500/"
        case .production:
            return "image.tmdb.org/t/p/w500/"
        }
    }
}
