//
//  NetworkServiceTests.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 2.05.2023.
//

import XCTest
@testable import MovieBood
import Resolver

final class BaseServiceTests: XCTestCase {

    var sut: BaseServiceProtocol!
    
    override func setUpWithError() throws {
        Resolver.setUp()
    }
    
    func test_SuccessfulResponse() {
//        GIVEN
        let session = MockLoader()
        let expected = "ExpectedString"
        let data = try! JSONEncoder().encode(expected)
        session.data = data
        session.urlResponse = URLResponse()
        
        Resolver.test.register { session as NetworkLoader }
        sut = NetworkService()
        
//        WHEN
        let requestObject = RequestObject(host: "", path: "/example-path")
        let response : String = sut.request(with: requestObject,
                                           decoder: JSONDecoder()) { result in
            
        }
        
//        THEN
        XCTAssertEqual(response, expected)

    }
}

