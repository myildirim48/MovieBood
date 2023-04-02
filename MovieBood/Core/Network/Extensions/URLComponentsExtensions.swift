//
//  URLComponentsExtensions.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Foundation
extension URLComponents{
    mutating func setQueryItems(with parameters: [String:String]){
        queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value)}
    }
}
