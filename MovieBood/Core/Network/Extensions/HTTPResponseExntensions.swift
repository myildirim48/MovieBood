//
//  HTTPResponseExntensions.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Foundation
extension HTTPURLResponse {
    var httpStatus: HTTPStatus? {
        HTTPStatus(rawValue: statusCode)
    }
}
