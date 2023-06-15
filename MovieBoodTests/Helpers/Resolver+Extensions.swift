//
//  Resolver+Extensions.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 15.06.2023.
//

import XCTest
import Resolver
@testable import MovieBood
extension Resolver {

    static var test: Resolver!

    static func setUp() {
        Resolver.test = Resolver(child: .main)
        Resolver.root = .test
    }

    static func tearDown() {
        Resolver.root = .main
    }
}
