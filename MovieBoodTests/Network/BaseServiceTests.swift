//
//  BaseServiceTests.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 15.06.2023.
//

import XCTest
@testable import MovieBood
import Resolver

final class BaseServiceTests: XCTestCase {
    
    var sut: NetworkService!
    
    override func setUpWithError() throws {
        Resolver.setUp()
    }
    
    override func tearDownWithError() throws {
        Resolver.tearDown()
        sut = nil
    }

    func testSuccessfullResponse() async throws {
        //        Given
        let session = MockLoader()
        let expected = "ExpectedString"
        let data = try! JSONEncoder().encode(expected)
        session.data = data
        session.urlResponse = URLResponse()

        Resolver.test.register { JSONDecoder() }
        Resolver.test.register { session as NetworkLoader }
        sut = NetworkService()
        //        When
        let requestObject = RequestObject(host: "", path: "/example-path")
        let response: String = try await sut.request(with: requestObject,decoder: JSONDecoder())
        //        Then
        XCTAssertEqual(response, expected)
    }

    func testErrorThrown() async throws {
        let session = MockLoader()
        let error = AppError.invalidUrlRequest
        session.error = error
        Resolver.test.register { session as NetworkLoader }
        
        sut = NetworkService()
        
        let requestObject = RequestObject(host: "", path: "")
        
        do {
            let _: String = try await self.sut.request(with: requestObject, decoder: JSONDecoder())
        } catch {
            XCTAssert(true)
            return
        }
        
        XCTAssert(false)
    
    }
}
