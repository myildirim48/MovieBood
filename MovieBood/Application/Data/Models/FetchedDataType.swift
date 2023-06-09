//
//  FetchedDataType.swift
//  MovieBood
//
//  Created by YILDIRIM on 2.04.2023.
//

import Foundation
enum FetchedDataType: String {
    case popular,nowPlaying,upComing, topRated
    
    var title : String {
        switch self {
        case .popular:
            return "Popular"
        case .nowPlaying:
            return "Now Playing"
        case .upComing:
            return "Up Coming"
        case .topRated:
            return "Top Rated"
        }
    }

}
