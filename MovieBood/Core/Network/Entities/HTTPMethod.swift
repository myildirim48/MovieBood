//
//  HTTPMethos.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Foundation
enum HTTPMethod: String, CustomStringConvertible{
    case get
    case post
    case put
    case delete
    
    var description: String{
        rawValue.uppercased()
    }
}
