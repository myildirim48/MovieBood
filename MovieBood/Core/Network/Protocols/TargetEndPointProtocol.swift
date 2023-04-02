//
//  TargetEndPointProtocol.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Foundation
protocol TargetEndpointProtocol {
    var base: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var commonRequestObject: RequestObject { get }
}

