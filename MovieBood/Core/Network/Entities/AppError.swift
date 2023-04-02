//
//  AppError.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Foundation
enum AppError: LocalizedError {
    case invalidUrlRequest
    case httpError(status: HTTPStatus, data: Data? = nil)
    case unknown(error: NSError)
    case customError(_ code: Int, _ message: String, _ data: Data? = nil)
    case mappingFailed
    case badResponse
    
    var errorCode: Int {
        switch self {
            case .httpError(let error, _):
                return error.rawValue
            case .unknown(let error):
                return error.code
            case .customError(let code, _, _):
                return code
            case .mappingFailed, .badResponse, .invalidUrlRequest:
                return 0
        }
    }
    
    var errorDescription: String? {
        switch self {
        default:
            return "Unknown error"
        }
    }
}
