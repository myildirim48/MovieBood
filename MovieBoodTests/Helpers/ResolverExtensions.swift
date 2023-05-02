//
//  ResolverExtensions.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 2.05.2023.
//

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

