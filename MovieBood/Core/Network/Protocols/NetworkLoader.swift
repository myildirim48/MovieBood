//
//  NetworkLoader.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Foundation
protocol NetworkLoader {
    func load(using request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void)
    func load(using request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data?, URLResponse)
}
